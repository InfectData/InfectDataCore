class ReportsController < ApplicationController
    before_action :allowed_to_create, only: [:new, :create]

  def new
    @report = Report.new
  end

  def index
    @reports = current_user.reports
  end

  def create

    #Weist dem Report automatisch die Current_User ID & District ID zu.
    @report = Report.new(report_params) do |r|
      r.user_id = current_user.id
      r.district_id = current_user.district_id
    end

    #Alle bestätigten Fälle, die zum Bezirk des Nutzers gehören & Zeitraum eingrenzen
    @cases = Case.confirmed.where(district_id: current_user.district_id, diagnosis_id: @report.diagnosis_id ,report_id: nil, created_at: @report.date.beginning_of_day..@report.date.end_of_day)

    respond_to do |format|
      if @report.save
        @cases.update_all(report_id: @report.id)
        format.html { redirect_to districts_path, notice: 'Report was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end


private

  #Schränkt den Zugriff für GA's ein
  def allowed_to_create
    redirect_to root_path unless current_user.role.in?(['ga'])
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:comment, :date, :created_at, :updated_at, :user_id, :district_id, :diagnosis_id)
  end
end

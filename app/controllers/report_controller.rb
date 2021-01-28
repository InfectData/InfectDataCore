class ReportController < ApplicationController
    before_action :allowed_to_create, only: [:new, :create]

  def new
    @report = Report.new
  end

  def index
    @reports = current_user.reports
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
    params.require(:report).permit(:comment, :date, :created_at, :updated_at, :user_id, :district_id)
  end
end

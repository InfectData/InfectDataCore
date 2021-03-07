class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy, :confirm]
  before_action :allowed_to_create, only: [:new, :create]

  #Um einen Fall durch Arzt/Labor zu bestätigen.
  def confirm
    @case.update_attribute("confirmed_at", Time.now)
    redirect_to cases_path
  end

  def index
    if params[:query].present?
      @cases = Case.where(pseud: params[:query])
    else
      @cases = current_user.cases.where(report_id: nil)
    end
  end

  def show
  end

  def new
    @case = Case.new
  end


  def edit
  end

  def create
    #Beide Lösungswege sind möglich, Block und einzeilig:
    #Weist dem Case automatisch die Current_User ID zu.
    @case = Case.new(case_params) do |c|
      c.user_id = current_user.id
    end

    #Weist dem Case automatisch die District ID des Users zu.
    #Könnte ggfs. auch mit einem Dropdown im Formular gelöst werden.
    @case.district = current_user.district

    respond_to do |format|
      if @case.save
        format.html { redirect_to @case, notice: 'Case was successfully created.' }
        format.json { render :show, status: :created, location: @case }
      else
        format.html { render :new }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @case.update(case_params)
        format.html { redirect_to @case, notice: 'Case was successfully updated.' }
        format.json { render :show, status: :ok, location: @case }
      else
        format.html { render :edit }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @case.destroy
    respond_to do |format|
      format.html { redirect_to cases_url, notice: 'Case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    #Schränkt den Zugriff für Ärzte und Labore ein
    def allowed_to_create
      redirect_to root_path unless current_user.role.in?(['arzt', 'labor'])
    end

    def set_case
      @case = Case.find(params[:id])
    end

    def case_params
      params.require(:case).permit(:first_name, :last_name, :gender,:birthdate, :place_of_residence,
        :diagnosis_id, :user_id, :case_id, :confirmed_at, :district_id, :report_id)
    end
end

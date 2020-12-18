class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy, :confirm]
  before_action :allowed_to_create, only: [:new, :create]

  #Um einen Fall durch Arzt/Labor zu bestätigen.
  def confirm
    Case.update_attribute(confirmed_at: Time.now)
    redirect_to cases_path
  end

  # GET /cases
  # GET /cases.json
  def index
    @cases = Case.where(:user_id => current_user.id)
  end

  # GET /cases/1
  # GET /cases/1.json
  def show
    @case = Case.find(params[:id])
  end

  # GET /cases/new
  def new
    @case = Case.new
    @case.user_id = current_user.id
  end

  # GET /cases/1/edit
  def edit
    @case = Case.find(params[:id])
  end

  # POST /cases
  # POST /cases.json
  def create
    @case = Case.new(case_params)

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

  # PATCH/PUT /cases/1
  # PATCH/PUT /cases/1.json
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

  # DELETE /cases/1
  # DELETE /cases/1.json
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
      unless current_user.role.in?(['arzt', 'labor'])
      redirect_to root_path
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_case
      @case = Case.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def case_params
      params.require(:case).permit(:first_name, :last_name, :gender, :birthdate, :place_of_residence, :diagnosis, :user_id, :confirmed_at)
    end
  end
end

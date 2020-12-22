class DiagnosesController < ApplicationController
  before_action :set_diagnosis, only: [:show, :edit, :update, :destroy]
  before_action :allowed_to_create, only: [:new, :create]


  def index
    @diagnoses = Diagnosis.all
  end

  def show
  end

  def new
    @diagnosis = Diagnosis.new
  end

  def edit
  end

  def create
    @diagnosis = Diagnosis.new(diagnosis_params)

    respond_to do |format|
      if @diagnosis.save
        format.html { redirect_to @diagnosis, notice: 'Diagnosis was successfully created.' }
        format.json { render :show, status: :created, location: @diagnosis }
      else
        format.html { render :new }
        format.json { render json: @diagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @diagnosis.update(diagnosis_params)
        format.html { redirect_to @diagnosis, notice: 'Diagnosis was successfully updated.' }
        format.json { render :show, status: :ok, location: @diagnosis }
      else
        format.html { render :edit }
        format.json { render json: @diagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @diagnosis.destroy
    respond_to do |format|
      format.html { redirect_to diagnoses_url, notice: 'Diagnosis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    #Nur das RKI darf Diagnosen anlegen.
    def allowed_to_create
      redirect_to root_path unless current_user.role.in?(['rki'])
    end

    def set_diagnosis
      @diagnosis = Diagnosis.find(params[:id])
    end

    def diagnosis_params
      params.require(:diagnosis).permit(:illness)
    end
end

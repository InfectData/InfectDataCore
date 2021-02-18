class Rki::DiagnosesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_rki?

  def current_user_rki?
    return if current_user.role == 'rki'
    redirect_to root_path
  end

  def index
    @diagnoses = Diagnosis.all
  end

  def cases
    #Alle Fälle zur Auswahl einer Diagnose
    @diagnosis = Diagnosis.includes(:cases).find_by(id: params[:id])
    @states = State.all
  end

end

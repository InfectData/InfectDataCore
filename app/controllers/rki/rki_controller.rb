class Rki::RkiController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_rki?

  def current_user_rki?
    return if current_user.role == 'rki'
    redirect_to root_path
  end

  def index
    @diagnoses = Diagnosis.all
  end

  def all_cases
    #Alle Fälle zur Auswahl einer Diagnose
    @diagnosis = Diagnosis.includes(:cases).find_by(id: params[:id])
  end

end

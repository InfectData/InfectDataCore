class RkisController < ApplicationController
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
    #show all the cases with a specific diagnosis
  end

end

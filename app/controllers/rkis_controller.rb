class RkisController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_rki?

  def current_user_rki?
    return if current_user.role == 'rki'
    redirect_to root_path
  end


  def index
    @cases = Case.all
  end

end

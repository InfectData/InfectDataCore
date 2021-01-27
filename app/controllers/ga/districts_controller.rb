class Ga::DistrictsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_ga?

  def current_user_ga?
    return if current_user.role == 'ga'
    redirect_to root_path
  end

  def index
    @district = District.includes(:cases).where(id: 1).first
  end

end

class Ga::DistrictsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_ga?

  def current_user_ga?
    return if current_user.role == 'ga'
    redirect_to root_path
  end

  def index
    @district = District.find(current_user.district_id)
    @cases = @district.cases.confirmed
  end

end

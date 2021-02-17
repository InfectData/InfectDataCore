class Ls::ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_ls?

  def current_user_ls?
    return if current_user.role == 'ls'
    redirect_to root_path
  end

  def index
    @districts = current_user.state.districts.map{|district| district.id}
    @reports = Report.where(district_id: @districts)
  end

end

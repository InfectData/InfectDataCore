class Ls::ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_ls?

  def current_user_ls?
    return if current_user.role == 'ls'
    redirect_to root_path
  end

  def index
    @reports = Reports.where(district_id: current_user.district_id)
  end

end

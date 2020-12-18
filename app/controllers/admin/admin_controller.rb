class Admin::AdminController < ApplicationController

  before_action :authenticate_user!
  before_action :current_user_admin?

  def current_user_admin?
  return if current_user.role == 'admin'
  redirect_to root_path
  end

end

class ApplicationController < ActionController::Base
before_action :authenticate_user!
#  def after_sign_in_path_for(resource)
#    @user = User.find (current_user)
#    if user.role = 'admin'
#    return "content#admin"
#   end
# end

#def after_sign_in_path_for(resource)
#  stored_location_for(resource) || "content#admin"
#end

end

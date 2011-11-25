class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  
  protected
  def login_required
  	redirect_to (root_path) if !current_user
  end
  
  def admin_required
  	if !((current_user.admin?) || (current_user.id == params[:id].to_i))
  		redirect_to root_path
  	end
  end
end

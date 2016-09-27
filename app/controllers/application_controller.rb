class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception
  
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def require_login
    return true if current_user
  
    redirect_to root_path, notice: "You must be logged in."
    return false
  end
  
end

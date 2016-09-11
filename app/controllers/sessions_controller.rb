class SessionsController < ApplicationController
  layout false
  def new
  end
  
  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id 
      redirect_to dashboard_path(), notice: "Succesfully logged in"
    else
      render action: 'new', alert: "Unable to login"
    end
  end
  
  def destroy
     reset_session
     redirect_to root_path, notice: 'Logged out'
   end
  
end

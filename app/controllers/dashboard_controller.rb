class DashboardController < ApplicationController
  before_action :require_login
  before_action :set_user, only: [:dashboard]

  def dashboard
    @practices = @user.practices
    @drills = @user.drills
  end

  private
    
    def set_user
      @user = current_user
    end
    
end

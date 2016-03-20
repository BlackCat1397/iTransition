class AdminController < ApplicationController

  before_action :authenticate_user!

  before_filter :verify_admin

  def index
    @users = User.all
  end

  private
  def verify_admin
    redirect_to root_url unless current_user.has_role?(:admin)
  end
end

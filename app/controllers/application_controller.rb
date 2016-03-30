class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_user

  def set_user
    cookies[:user_role] = current_user ? current_user.roles : 'guest'
  end
end

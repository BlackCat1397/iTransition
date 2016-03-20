class UsersController < ApplicationController
  def new
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def show
    @user = User.find(params[:id])
  end
end

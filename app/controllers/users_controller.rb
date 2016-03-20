class UsersController < ApplicationController
  load_and_authorize_resource


  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.update_attributes(user_params)
    respond_to do |format|
      format.html { redirect_to admin_url, notice: 'User was successfully updated.' }
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end

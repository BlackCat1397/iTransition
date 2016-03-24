class PostsController < ApplicationController
  load_and_authorize_resource
  before_action only: [:show, :edit, :update, :destroy, :save]


  def new
  end

  def post_params
    params.require(:post).permit(:title)
  end

  def show
  end

  def edit
  end

  def save
  end

  def create
    @user = User.find_by(:id => params[:user_id])
    @post = @user.posts.create(post_params)
    @post.chapters.create(:number => 1, :title => 'First chapter')
    redirect_to edit_user_post_path(:id => @post.id)
  end

  def update
    @user.save(validate: false)
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
end

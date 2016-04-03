class PostsController < ApplicationController
  load_and_authorize_resource
  before_action only: [:show, :edit, :update, :destroy, :save]


  def new
  end

  def post_params
    params.require(:post).permit(:title)
  end

  def show
    @post = Post.find_by(:id => params[:id])
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

  def rating
    @post = Post.find_by(:id => params[:id])
    @stars = @post.ratings.average(:stars)||('-')
    if current_user
      if(@rating = @post.ratings.find_by(:user_id => current_user.id))
        render :json => {:user_stars => @rating.stars, :stars => @stars}
      else
        render :json => {:stars => @stars}
      end 
    else
      render :json => {:stars => @stars}
    end 
  end
  
  def update
  end

  def comment
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_url(:id => params[:user_id]), notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end

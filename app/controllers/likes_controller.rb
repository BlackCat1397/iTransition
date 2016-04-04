class LikesController < ApplicationController
  def index
  end

  def new
    @like = Like.new
  end

  def create
    @like = Like.find_by(:comment_id => like_params[:comment_id], :user_id => like_params[:user_id])
    if @like
      @like.destroy
    else
      @like = Like.new(like_params)
      @like.save
    end

    respond_to do |format|
      if @like.save
        format.html { redirect_to '#', notice: 'like was successfully created.' }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end    
  end

  private
    def like_params
      params.require(:like).permit(:comment_id, :user_id)
    end
end

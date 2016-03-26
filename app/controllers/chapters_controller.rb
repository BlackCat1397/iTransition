class ChaptersController < ApplicationController
  def new
    @chapter = Chapter.new
  end

  def chapter_params
    params.require(:chapter).permit(:title, :content)
  end

  def create
    @post = Post.find_by(:id => params[:post_id])
    @post.chapters.create(chapter_params)
    redirect_to edit_user_post_path(:id => @post.id)
  end

  def edit
    @chapter = Chapter.find_by(:id => params[:id])
  end

  def update
    @chapter = Chapter.find_by(:id => params[:id])
    @chapter.update(chapter_params)
    redirect_to edit_user_post_path(:id => params[:post_id])
  end
end
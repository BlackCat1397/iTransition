class StaticPagesController < ApplicationController
  def home
    @posts = Post.order(:updated_at).limit(10)
  end

  def help
  end

  def about
  end

  def contact
  end
end

class Chapter < ActiveRecord::Base
  belongs_to :post

  def show
  end

  def user_id
    self.post.user_id
  end
end

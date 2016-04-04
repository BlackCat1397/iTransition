class Chapter < ActiveRecord::Base
  belongs_to :post
  belongs_to :users

  def show
  end

  def user_id
    self.post.user_id
  end
end

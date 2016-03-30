class Post < ActiveRecord::Base
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def show
  end
end

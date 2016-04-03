class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
                          :trackable, :validatable, :lockable

  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts
  has_many :likes, through: :comments
  before_create :set_default_role

  ROLES = %i[admin user]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) &2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }

  private 
  def set_default_role
    self.roles = 'user'
  end
end

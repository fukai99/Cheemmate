class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post
  
  has_one_attached :avatar
  validates :is_member, inclusion: { in: [true, false] }
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
end

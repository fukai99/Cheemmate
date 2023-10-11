class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  
  has_many :bookmarks, dependent: :destroy
  
  
  has_one_attached :avatar
  validates :is_member, inclusion: { in: [true, false] }
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def get_avatar(width, height)
    unless avatar.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      avatar.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    avatar.variant(resize_to_limit: [width, height]).processed
  end
end

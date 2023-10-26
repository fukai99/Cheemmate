class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :bookmarks, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_one_attached :avatar
  validates :is_member, inclusion: { in: [true, false] }
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :disply_name, presence: true
  validates :family_relationship, presence: true

  def active_for_authentication?
    super && (is_deleted == false)
  end

  # ユーザーのアバター
  def get_avatar(width, height)
    unless avatar.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      avatar.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    avatar.variant(resize_to_limit: [width, height]).processed
  end

  def commented_on?(post)
    comments.exists?(post_id: post.id)
  end

   # 検索方法分岐
  def self.looks(word, is_admin)
    if is_admin
      @users = where("first_name LIKE ?", "%#{word}%")
                .or(where("family_name LIKE ?", "%#{word}%"))
    else
      @users = where("disply_name LIKE ?", "%#{word}%")
    end

    if @users.empty?
      @users = User.all
    end
    @users = @users.where(is_deleted: false)
    return @users
  end

  # ゲスト
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.family_name = "guest"
      user.first_name = "user"
      user.is_member = false
      user.disply_name = "ゲストユーザー"
      user.family_relationship = "ゲスト"
    end
  end

  def guest_user?
    email == GUEST_USER_EMAIL
  end
end

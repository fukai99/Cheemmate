class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :youtube_urls, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  
  
  
  # def get_avatar(width, height)
  #   unless avatar.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #     avatar.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   avatar.variant(resize_to_limit: [width, height]).processed
  # end
  
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索方法分岐
  def self.looks(word)
    @posts = Post.where("content LIKE ?", "%#{word}%")
    if @posts.empty?
      @posts = Post.all
    end
    return @posts
  end



end

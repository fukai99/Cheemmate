class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_one :youtube_url, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  
  validates :content, presence: true
  
  validates :images, presence: true, if: -> { youtube_url.blank? }
  validates :youtube_url, presence: true, if: -> { images.blank? }
  
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

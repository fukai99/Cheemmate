class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :youtube_urls, dependent: :destroy
  accepts_nested_attributes_for :youtube_urls, allow_destroy: true
  has_many :comments, dependent: :destroy

  has_many_attached :images, dependent: :destroy
end

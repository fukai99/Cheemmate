class Post < ApplicationRecord
  belongs_to :user
  
  has_many :post_genres, dependent: :destroy
  has_many :genres, through: :post_genres, dependent: :destroy

  has_many :comments, dependent: :destroy
  
  has_many_attached :images, dependent: :destroy
  
  
end

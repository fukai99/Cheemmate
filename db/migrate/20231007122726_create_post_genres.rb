class CreatePostGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :post_genres do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
      t.index [:genre_id, :post_id], unique: true
    end
  end
end

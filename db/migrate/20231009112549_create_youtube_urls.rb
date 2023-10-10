class CreateYoutubeUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :youtube_urls do |t|
      t.string :path
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end

Admin.find_or_create_by!(email: "123@456") do |admin|
  admin.name = "山田"
  admin.password = "123456"
end

a_genre = Genre.find_or_create_by!(name: "A")

yamada = User.find_or_create_by!(email: "aiu@aiu") do |user|
  user.password = "123456"
  user.family_name = "山田"
  user.first_name = "やまだ"
  user.disply_name = "ヤマダ"
  user.family_relationship = "親"
end

hatsu_post = Post.find_or_create_by!(content: "初投稿です") do |post|
  post.user = yamada
  post.genre = a_genre
end

hatsu_post.youtube_urls.find_or_create_by!(path: "SZXZq-0YS48")
hatsu_post.youtube_urls.find_or_create_by!(path: "TQMbvJNRpLE")

puts "データの作成が完了しました"

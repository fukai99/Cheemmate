Admin.find_or_create_by!(email: "123@456") do |admin|
  admin.password = "123456"
end

a_genre = Genre.find_or_create_by!(name: "A")

yamada = User.find_or_create_by!(email: "aiu@aiu") do |user|
  user.password = "123456"
  user.family_name = "山田"
  user.first_name = "やまだ"
  user.disply_name = "ヤマダ"
  user.is_member = false
  user.family_relationship = "親"
end

hatsu_post = Post.find_or_create_by!(content: "初投稿です") do |post|
  post.user = yamada
  post.genre = a_genre
end

YoutubeUrl.find_or_create_by!(path: "OJmSwcww-pw", post_id: hatsu_post.id)
# YoutubeUrl.find_or_create_by!(path: "iBDPW82ouCY", post_id: hatsu_post.id)

puts "データの作成が完了しました"

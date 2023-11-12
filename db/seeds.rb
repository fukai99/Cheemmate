Admin.find_or_create_by!(email: "123@456") do |admin|
  admin.password = "123456"
end

# a_genre = Genre.find_or_create_by!(name: "A")

# yamada = User.find_or_create_by!(email: "aiu@aiu") do |user|
#   user.password = "123456"
#   user.family_name = "山田"
#   user.first_name = "やまだ"
#   user.disply_name = "ヤマダ"
#   user.is_member = false
#   user.family_relationship = "親"
# end

# hatsu_post = Post.find_or_create_by!(content: "次の振り付け共有します。") do |post|
#   post.user = yamada
#   post.genre = a_genre
# end

# YoutubeUrl.find_or_create_by!(path: "b7B-F1O-AE8", post_id: hatsu_post.id)



puts "データの作成が完了しました"

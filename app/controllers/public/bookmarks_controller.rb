class Public::BookmarksController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    bookmark = current_user.bookmark.new(post_id: post.id)
    bookmark.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Post.find(params[:post_id])
    bookmark = current_user.bookmark.find_by(post_id: post.id)
    bookmark.destroy
    redirect_back(fallback_location: root_path)
  end
  
  def show
    @user = current_user
    @bookmarks = @user.bookmarks.order(created_at: :desc)
  end
end

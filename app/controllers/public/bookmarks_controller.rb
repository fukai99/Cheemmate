class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.new(post_id: post.id)
    bookmark.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.find_by(post_id: post.id)
    bookmark.destroy
    redirect_back(fallback_location: root_path)
  end

  def show
    @user = current_user
    @bookmarks = @user.bookmarks.order(created_at: :desc)
  end
end

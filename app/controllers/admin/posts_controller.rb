class Admin::PostsController < ApplicationController
  
  def index
    @posts = Post.order(created_at: :desc)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to  admin_post_path(post.id)
  end
  
  
end

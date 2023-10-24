class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if(params[:genre_id])
      @posts = Post.where(genre_id: params[:genre_id]).order(created_at: :desc)
    else
      @posts = Post.order(created_at: :desc)
    end
       @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to request.referer
  end
end

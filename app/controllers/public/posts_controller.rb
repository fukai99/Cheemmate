class Public::PostsController < ApplicationController
  

  def new
     @post = Post.new
  end

  def create
    post = Post.new(post_params)
    url = params[:post][:youtube_url]
    url = url.last(11)
    post.youtube_url = url
    post.user_id = current_user.id
    post.save
    redirect_to user_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       flash[:notice] = "変更しました。"
       redirect_to user_path
    else
      flash[:notice] = "変更に失敗しました。"
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path
  end

  def index
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:content, images: [])  
  end
end

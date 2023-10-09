class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
     @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    # 改行コード込みで送られてくるので改行コードで分割して文字列の配列にする
    youtube_urls = params[:youtube_url].split(/\R/)
    youtube_urls.each do |url|
      @post.youtube_urls.new(path: url.last(11))
    end

    if @post.save
      redirect_to user_path(current_user)
    else
      render :new
    end
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
    redirect_to user_path(current_user)
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:content, :genre_id, images: [])
  end
end

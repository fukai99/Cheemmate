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

    # 画像か動画のどちらかが添付されている
    if @post.images.attached? || @post.youtube_urls.any?
      if @post.save
        redirect_to user_path(@post.user), notice: "投稿が保存されました。"
      else
        render :new
      end
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
      flash[:notice] = "変更しました."
      redirect_to user_path(current_user)
    else
      flash[:notice] = "変更に失敗しました。"
      render :edit
    end
    #post_p = post_params
    #post_p[:youtube_urls_attributes]["0"][:path] = post_p[:youtube_urls_attributes]["0"][:path].last(11)
    #if @post.update(post_p)
      #flash[:notice] = "変更しました。"
      #redirect_to user_path(current_user)
    #else
      #flash[:notice] = "変更に失敗しました。"
      #render :edit
    #end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end

  def index
    @posts = Post.order(created_at: :desc)
    @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:content, :genre_id, images: [])
  end
end

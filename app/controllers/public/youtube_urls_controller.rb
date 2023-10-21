class Public::YoutubeUrlsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @youtube_url = YoutubeUrl.new
  end

  def create
    @post = Post.find(params[:post_id])
    @youtube_url = YoutubeUrl.new(youtube_urls_params)
    @youtube_url.post_id = @post.id
    if @youtube_url.save!
      flash[:notice] = "動画を変更しました."
      redirect_to edit_post_path(@post.id)
    else
      flash[:alert] = "動画の変更に失敗しました。"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @youtube_url = YoutubeUrl.find_by(post_id: params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
    @youtube_url = @post.youtube_url
    if @youtube_url.update(youtube_urls_params)
      lash[:notice] = "動画を変更しました."
      redirect_to edit_post_path(@post.id)
    else
      flash[:alert] = "動画の変更に失敗しました。"
      render :edit
    end
  end



  private

  def youtube_urls_params
    params.require(:youtube_url).permit(:path)
  end
end

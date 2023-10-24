class Public::YoutubeUrlsController < ApplicationController
  before_action :authenticate_user!

  

  def edit
    @post = Post.find(params[:post_id])
    @youtube_url = YoutubeUrl.find_by(post_id: params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
    
      
    
    @youtube_url = @post.youtube_url || @post.build_youtube_url
    if @youtube_url.update(youtube_urls_params)
      flash[:notice] = "動画を変更しました。"
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

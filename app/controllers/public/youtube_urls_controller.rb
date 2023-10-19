class Public::YoutubeUrlsController < ApplicationController
  before_action :authenticate_user!
  
  def edit
    @youtube_url = YoutubeUrl.find_by(post_id: params[:id])
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    youtube_urls = youtube_urls_params[:path].split(/\R/)
    
    youtube_urls.each do |url|
      # 動画URLがすでに存在するかチェック
      @youtube_url = @post.youtube_urls.find_or_initialize_by(path: url.last(11))
      
      update_attributes(params[:path])

      if @youtube_url.save
        flash[:notice] = "動画を変更しました."
      else
        flash[:alert] = "動画の変更に失敗しました。"
      end
    end
    
    redirect_to edit_post_path(@post)
  end

  private

  def youtube_urls_params
    params.require(:post).permit(:path)
  end
end


class Public::YoutubeUrlsController < ApplicationController
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    youtube_urls = params[:youtube_url].split(/\R/)
    youtube_urls.each do |url|
      @post.youtube_urls.new(path: url.last(11))
    end
    if @post.update(post_params)
      flash[:notice] = "動画を変更しました."
      redirect_to edit_post_path(current_user)
    else
      flash[:notice] = "動画の変更に失敗しました。"
      render :edit
    end
  end  
    private

  def post_params
    params.require(:post).permit(:path)
  end
end

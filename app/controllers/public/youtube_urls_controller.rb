class Public::YoutubeUrlsController < ApplicationController
  def edit
    @youtube_url = YoutubeUrl.find_by(post_id: params[:id])
    @post = Post.find(params[:id])
  end

  def update
    @youtube_url = YoutubeUrl.find_by(post_id: params[:id]) # 存在する場合
    
    @post = Post.find(params[:id])
    pp "parms---------------------------------#{params}"
    youtube_urls = youtube_urls_params[:path].split(/\R/)
    pp "youtube_urls---------------------------------#{youtube_urls}"
    youtube_urls.each do |url|
      @post.youtube_urls.new(path: url.last(11))
      @youtube_url = YoutubeUrl.new(path: url.last(11)) # 存在しない
      @youtube_url.save # 新規登録
      
      # youtube_url = url.last(11)
    if @youtube_url.update(path: url.last(11))
      flash[:notice] = "動画を変更しました."
      redirect_to edit_post_path(@post)
    else
      flash[:notice] = "動画の変更に失敗しました。"
      render :edit
    end
    end

  end
    private

  def youtube_urls_params
    params.require(:post).permit(:path)
  end
end

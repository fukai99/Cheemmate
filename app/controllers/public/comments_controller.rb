class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(post_comment_params)
    @comment.user = current_user
    @comment.post = post
    if @comment.save
      # redirect_to post_path(post), notice: "コメントが投稿されました"
    # else
    #   flash[:error] = "コメントを投稿できませんでした"
    #   redirect_back(fallback_location: post_path(post))
    end
  end

  def destroy
  end

  private

  def post_comment_params
    params.require(:comment).permit(:content)
  end

end

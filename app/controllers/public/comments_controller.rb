class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(post_comment_params)
    @comment.user = current_user
    @comment.post = post
    @comment.save
  end

  def destroy
  end

  private

  def post_comment_params
    params.require(:comment).permit(:content)
  end

end

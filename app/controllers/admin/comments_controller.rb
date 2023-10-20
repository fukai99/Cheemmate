class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    comment.destroy
    redirect_to admin_post_path(post)
  end
end

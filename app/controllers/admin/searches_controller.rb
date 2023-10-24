class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @range = params[:range]
    @word = params[:word]

    if @word.blank?
      redirect_to request.referer
    else

      if @range == "User"
        @users = User.looks(params[:search], @word, true)
      else
        @posts = Post.looks(params[:search], @word, false)
      end
    end
  end
end

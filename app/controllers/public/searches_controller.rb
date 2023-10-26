class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]

    if @word.blank?
      flash[:notice] = "入力が必要です。"
      redirect_to request.referer
    else

      if @range == "User"
        @users = User.looks(@word, false)
      else
        @posts = Post.looks(@word)
      end

    end
  end
end

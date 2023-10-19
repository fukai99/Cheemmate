class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], @word, false)
    else
      @posts = Post.looks(params[:search], @word, false)
    end
  end
end

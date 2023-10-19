class Admin::SearchesController < ApplicationController
  
  
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], @word, true)
    else
      @posts = Post.looks(params[:search], @word, false)
    end
  end
  
end

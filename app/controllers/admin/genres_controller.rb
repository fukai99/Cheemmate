class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    #投稿
    @genre = Genre.new
    #一覧
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを追加しました。"
      redirect_to admin_genres_path
    else
      flash[:notice] = "入力が必要です。"
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
       flash[:notice] = "変更しました。"
       redirect_to admin_genres_path
    else
      flash[:notice] = "入力が必要です。"
      render :edit
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    flash[:notice] = "ジャンルを削除しました。"
    redirect_to admin_genres_path
  end

private

  def genre_params
    params.require(:genre).permit(:name)
  end

end



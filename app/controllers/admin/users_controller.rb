class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "変更しました。"
       redirect_to admin_homes_top_path
    else
      flash[:notice] = "変更に失敗しました。"
      render :edit
    end
  end

  def withdrawal
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to admin_homes_top_path
  end

  private
  def user_params
    params.require(:user).permit(:family_name, :first_name, :disply_name, :family_relationship, :is_member)
  end

end

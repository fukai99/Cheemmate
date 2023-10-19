class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(updated_at: :desc)
    @genres = Genre.all
  end

  def edit
    is_matching_login_user
     @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
      @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更しました."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:disply_name, :avatar, :is_member)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user),method: :get
    end
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  

end

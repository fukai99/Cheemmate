class Public::UsersController < ApplicationController
  def show
    @user = current_user
    #@user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    is_matching_login_user
     @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更しました."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def withdrawal
  end
  
  private
  
  def user_params
    params.require(:user).permit(:disply_name, :avatar, :family_relationship)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user),method: :get
    end
  end
  
end

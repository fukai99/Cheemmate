class Admin::HomesController < ApplicationController
  def top
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  
  
  
end

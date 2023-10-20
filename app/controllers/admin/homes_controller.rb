class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to profile_users_path
    else
      render :profile
    end
  end

  def profile
    @user = User.find(current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :introduction)
  end
end

class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # updateの構文：モデルのインスタンス.update(更新データ)
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "会員情報が更新されました。"
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image, :status)
  end

end

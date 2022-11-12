class Users::UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(status: :true).page(params[:page]).order(id: "DESC")
  end

  def confirm
    @user = User.find(params[:id])
    @posts = @user.posts.where(status: false).order(id: "DESC").page(params[:page]).per(20)
  end

  def edit
    @user = User.find(params[:id])
    @posts = @user.posts
    if @user.id != current_user.id
    redirect_to profile_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to profile_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    # byebug
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image)
  end

end
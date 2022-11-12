class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  

  private

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image, :status)
  end

end

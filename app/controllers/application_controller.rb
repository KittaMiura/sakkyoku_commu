class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  #ログイン後はトップページへ飛びます↓
  def after_sign_in_path_for(resource)
    posts_path
  end

  #ログアウト後はトップページへ飛びます↓
  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    posts_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:user_name])
  end

end

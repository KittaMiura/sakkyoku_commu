Rails.application.routes.draw do

  root :to => 'users/homes#top'
  get 'about' => 'users/homes#about'

  scope module: :users do
    resources :posts
  end

  namespace :admin do
    root :to => "homes#top"
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip:[:registrations, :passwords],controllers:{
    sessions: "admin/sessions"
  }

  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

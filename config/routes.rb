Rails.application.routes.draw do

  root :to => 'users/homes#top'
  get 'about' => 'users/homes#about'

  scope module: :users do
    resources :users, only: [:index, :edit, :update]
    get '/users/my_page' => 'users#show'
    # 退会確認画面
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    # 論理削除用のルーティング
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
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

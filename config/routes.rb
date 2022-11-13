Rails.application.routes.draw do

  root :to => 'users/homes#top'
  get 'about' => 'users/homes#about'

  scope module: :users do
    resources :users, only: [:index, :edit, :update] do
      member do
        get :favorites
        get :confirm
      end
    end
    # ユーザー詳細画面のルーティング
    get '/users/:id/profile' => 'users#show', as: 'profile'
    # 退会確認画面のルーティング
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    # 論理削除用のルーティング
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    # タグ検索機能のルーティング
    get "search_tag"=>"posts#search_tag"
    # ワード検索のルーティング
    get "search" => "searches#search"
    # グループ機能のルーティング
    resources :groups, except: [:destroy]
  end

  namespace :admin do
    root :to => "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    resources :tags, only: [:index, :create, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update]
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

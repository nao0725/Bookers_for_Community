Rails.application.routes.draw do
  #ルートパス
  root to: "homes#top"
  get "home/about" => "homes#about"

  #deviseのユーザー
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]

  #book,favorite,commentのルーティング
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  #フォロー機能ルーティング
  resources :relationships, only: [:create, :destroy]
   get "relationship/follow_users" => "relationships#follow_users"
   get "relationship/follower_users" => "relationships#follower_users"

  #検索機能ルーティング
  get "/search" => "searches#search"

  #グループ機能のルーティング
  resources :groups do
    get "join" => "groups#join"
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end
end

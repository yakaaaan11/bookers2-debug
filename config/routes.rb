Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
      member do
        get :follows, :followers
      end
    resource :relationships, only: [:create, :destroy]
  end
  
  resources :books,only: [:new,:create,:index,:show,:edit,:update,:destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  root 'homes#top'
  get 'home/about' => 'homes#about'
end
Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books,only: [:new,:create,:index,:show,:edit,:update,:destroy]

  root 'homes#top'
  get 'home/about' => 'homes#about'
end
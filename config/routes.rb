Rails.application.routes.draw do
get 'home/index'
get 'home/about'
devise_for :users
root to: "home#index"
  # For details on the DSL available within this file, sresources :books, only: [:new, :create, :index, :show]
resources :users, only: [:show, :edit, :update, :index]
resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
 end
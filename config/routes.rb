Rails.application.routes.draw do
  root  'fruits#index'
  devise_for :users
  resources :users
  resources :trees
  resources :requests

  resources :fruits do
    resources :harvests
  end

  resources :harvests do
    resources :members
  end

  resources :harvests, only: :show do
    resources :reviews, only: [:new, :create]
  end

  resources :trees, only: :index do
    resources :requests, only: [:new, :create]
  end

end

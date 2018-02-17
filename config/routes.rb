Rails.application.routes.draw do
  root  'fruits#index'
  devise_for :users
  resources :fruits do
    resources :harvests
  end
  resources :users
  resources :harvests do
    resources :members
  end
  resources :harvests, only: :show do
    resources :reviews, only: [:new, :create]
  end
  resources :trees
end

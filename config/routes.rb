Rails.application.routes.draw do
  root "users#index"
  devise_for :users
  resources :users, only: :show
  resources :games, only: [:create, :show, :update]
end

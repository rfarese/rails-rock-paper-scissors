Rails.application.routes.draw do
  root "users#index"

  devise_for :users

  resources :computer_players

  resources :games

  resources :game_rounds
end

Rails.application.routes.draw do
  root to: 'home#welcome'
  devise_for :users

  resources :users, only: [:index, :show]
  resources :articles, only: [:index, :create]
  resources :friendships, only: [:index, :create, :delete]
  get 'subscriptions', to: "friendships#subscriptions"
  get 'subscribers', to: "friendships#subscribers"
end

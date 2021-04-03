Rails.application.routes.draw do
  root to: 'home#welcome'
  devise_for :users

  resources :users, only: [:index, :show] do
    member do
      post 'change-status'
      get  'photos'
    end
  end
  resources :articles, only: [:index, :create]
  resources :friendships, only: [:index, :create, :destroy]
  get 'subscriptions', to: 'friendships#subscriptions'
  get 'subscribers', to: 'friendships#subscribers'
  resources :dialogs, only: [:index, :show, :create]
  resources :messages, only: [:create, :update, :destroy]
  resources :likes, only: [:create]
  resources :comments, only: [:create, :index, :show]
  resources :pictures

  mount ActionCable.server, at: '/cable'
end

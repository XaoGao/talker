require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root to: 'home#welcome'
  devise_for :users

  resources :users, only: %i[index show] do
    member do
      post 'change-status'
      get  'photos'
      get 'subscriptions', to: 'friendships#subscriptions'
      get 'subscribers', to: 'friendships#subscribers'
    end
  end
  resources :articles, only: %i[index create]
  resources :friendships, only: %i[index create destroy]
  resources :dialogs, only: %i[index show create]
  resources :messages, only: %i[create update destroy]
  resources :likes, only: %i[index create]
  resources :comments, only: %i[create index show]
  resources :pictures, only: %i[create destroy] do
    member do
      put 'main', to: 'pictures#main'
    end
  end

  resources :bookmarks, only: %i[index create destroy]

  resources :notifications, only: [:index] do
    get 'unread',   to: 'notifications#unread',   on: :collection
    get 'recently', to: 'notifications#recently', on: :collection
    put 'read',     to: 'notifications#read',     on: :collection
  end

  resources :games, only: [:index]

  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'
      resources :articles, only: [:index]
    end
  end

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  mount ActionCable.server, at: '/cable'
end

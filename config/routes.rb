Rails.application.routes.draw do
  root to: 'home#welcome'
  devise_for :users

  resources :users, only: [:index, :show]
end

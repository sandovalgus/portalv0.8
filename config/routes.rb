Rails.application.routes.draw do
  devise_for :users
  get 'home/home'
  get 'home/search'
  resources :benefices
  resources :zones
  resources :addresses
  resources :customers do
    collection do
      post 'import'
    end
  end
  root to: 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"


end

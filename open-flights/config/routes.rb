require 'sidekiq/web'

Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :airlines, param: :slug
      resources :reviews, only: [:create, :destroy]
    end
  end
  
  mount Sidekiq::Web => '/sidekiq'

  get '*path', to: 'pages#index', via: :all
end

Rails.application.routes.draw do
  root to: "links#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :links, only: [:index, :create, :edit, :update, :show]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create, :index]
    end
  end
end

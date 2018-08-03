Rails.application.routes.draw do
  root "static_pages#home"
  get "/signin", to: "sessions#new"
  get '/auth/facebook/callback', to: 'sessions#create'
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  resources :recipes
  resources :users
  resources :ingredients, only: [:index]
end

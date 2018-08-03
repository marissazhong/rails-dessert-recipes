Rails.application.routes.draw do
  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  get '/auth/facebook/callback' => 'sessions#create'
  # get 'auth/failure', to: redirect('/signin')
  delete "/signout", to: "sessions#destroy"
  resources :recipes
  resources :users
  resources :pantries, only: [:show, :edit, :update, :destroy]
  resources :ingredients, only: [:index]
end

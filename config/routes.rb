Rails.application.routes.draw do
  root "static_pages#home"
  get "/signin", to: "sessions#new"
  get '/auth/facebook/callback' => 'sessions#create'
  # get 'auth/failure', to: redirect('/signin')
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  resources :recipes
  resources :users
  resources :pantries, only: [:show, :edit, :update]
  resources :ingredients, only: [:index]
end

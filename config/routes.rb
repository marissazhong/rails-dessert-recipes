Rails.application.routes.draw do
  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  get '/auth/facebook/callback' => 'sessions#create'
  # get 'auth/failure', to: redirect('/signin')
  delete "/signout", to: "sessions#destroy"
  resources :recipes
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :users, only: [:show] do
    resources :recipes, only: [:show, :index, :new, :create]
  end
  resources :pantries, only: [:show, :edit, :update, :destroy]
  resources :ingredients, only: [:index]
  get "/fastest", to: "recipes#fastest"

end

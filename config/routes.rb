Rails.application.routes.draw do

  root 'static#home'

  get '/signin' => 'sessions#new'
  post '/sessions/create' => 'sessions#create'
  post '/signout' => 'sessions#destroy'

  post '/rides/new' => 'rides#new'

  resources :users
  resources :attractions

  

end
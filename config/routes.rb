Amdb::Application.routes.draw do
  root to: 'sessions#new'

  get '/sessions/new' => 'sessions#new', as: 'new_session'
  post '/sessions' => 'sessions#create', as: 'sessions'
  delete '/sessions' => 'sessions#destroy', as: 'session'

  resources :actors
  resources :directors
  resources :movies
  resources :roles
  resources :users
  resources :votes
end

Rails.application.routes.draw do

resources :users
resources :attractions
resources :rides

root 'application#home'

get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'
  post '/rides/new', to: 'rides#new'

end
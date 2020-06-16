Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#show" 

  resources :users, only: [:show]

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create', as: 'post_signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create', as: 'create_session'
  post '/logout', to: 'sessions#destroy', as: 'logout'


end

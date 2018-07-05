Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :posts, only: [:new, :create, :index]
  root     'users#show'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  get    '/logout',   to: 'sessions#destroy'
end

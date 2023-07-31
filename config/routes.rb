Rails.application.routes.draw do
  get 'sessions/new'
  resources :pictures
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end

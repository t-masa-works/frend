Rails.application.routes.draw do
  resources :pictures
  resources :users, only: [:new, :create]
end

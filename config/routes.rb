Rails.application.routes.draw do

  root "users#index"


  resources :sessions, only: [:new, :create, :destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  get '/log_out', to: 'sessions#destroy', as: :log_out


  resources :users, only: [:new, :create]
  get '/sign_up', to: 'users#new', as: :sign_up


  resources :users
  resources :lists
  resources :transactions

end

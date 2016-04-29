Rails.application.routes.draw do
  devise_for :users
  resources :books

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  resources :contacts

  root 'contacts#index'
end

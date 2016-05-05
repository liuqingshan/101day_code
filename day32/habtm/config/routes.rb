Rails.application.routes.draw do
  resources :productions
  root "productions#index"

  resources :categories
  resources :productions
end

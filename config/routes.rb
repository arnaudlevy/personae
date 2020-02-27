Rails.application.routes.draw do
  resources :variables
  resources :people
  resources :studies
  root to: 'studies#index'
end

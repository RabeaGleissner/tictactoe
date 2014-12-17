Rails.application.routes.draw do
  
  devise_for :users
  root "home#index"

  resources :matches
  resources :moves
  resources :users
  
  post '/matches/:id/match', to: 'matches#new_match'
end

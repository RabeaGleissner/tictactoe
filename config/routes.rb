Rails.application.routes.draw do
  
  devise_for :users

  root "home#index"

  resources :users
  resources :matches 

  post '/matches/:id/make_move/:position', to: 'matches#new_move', as: 'make_move'


end

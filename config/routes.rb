Rails.application.routes.draw do
  

  root "home#index"

  post '/matches/:id/make_move/:position', to: 'matches#new_move', as: 'make_move'

  devise_for :users
  resources :users
  resources :matches 


end

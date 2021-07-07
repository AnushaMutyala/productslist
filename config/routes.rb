Rails.application.routes.draw do
  
  devise_for :users
  resources :products
  #delete '/products/:id' => 'listings#destroy'
  root 'dashboard#index'
end
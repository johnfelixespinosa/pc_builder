Rails.application.routes.draw do
  
  resources :parts_lists
  devise_for :users
  root to: 'home#index'

  resources :users

end

Rails.application.routes.draw do
  
  devise_for :users
  root to: 'home#index'

  resources :parts_lists
  resources :builds

  resources :users do 
    resources :parts_lists, only: [:show, :index, :new, :edit, :update, :destroy]
    resources :builds
  end
end

Rails.application.routes.draw do
  
  resources :builds
  devise_for :users
  root to: 'home#index'

  resources :parts_lists

  resources :users do 
    resources :parts_lists, only: [:show, :index, :new, :edit, :update, :destroy]
  end
end

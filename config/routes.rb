Rails.application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  root to: 'home#index'

  resources :parts_lists, except: [:show]

  resources :builds, except: [:index] do
    get :index, on: :collection, :action => 'index_all'
  end

  resources :builds do
    resources :comments
  end

  resources :builds do
    resources :users do
      post "like",      to: "likes#create"
      delete "dislike", to: "likes#destroy"
    end 
  end

  resources :users do 
    resources :parts_lists, only: [:show, :index, :new, :edit, :update, :destroy]
    resources :builds, except: [:index] do
      get :index, on: :collection, :action => 'index_builds'
    end
  end

end

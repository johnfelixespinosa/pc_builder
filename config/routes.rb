Rails.application.routes.draw do
  
  devise_for :users
  root to: 'home#index'

  resources :parts_lists, except: [:show]

  resources :builds, except: [:index] do
    get :index, on: :collection, :action => 'index_all'
  end

  resources :builds do
    resources :likes
  end

  resources :users do 
    resources :parts_lists, only: [:show, :index, :new, :edit, :update, :destroy]
    resources :builds, except: [:index] do
      get :index, on: :collection, :action => 'index_builds'
    end
  end

end

Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users, only: %i(index destroy) do
    get :export, on: :collection
  end

  namespace :admin do
    resources :users, except: %i(show destroy)
  end
end

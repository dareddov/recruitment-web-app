Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users, only: %i(index destroy)

  namespace :admin do
    resources :users, except: :show
  end
end

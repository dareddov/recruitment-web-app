Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users, only: %i[index destroy]
  resources :regards_send, only: %i[create]

  namespace :admin do
    resources :users, except: %i[show destroy]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

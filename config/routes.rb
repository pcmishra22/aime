Rails.application.routes.draw do

  root to: 'visitors#index'

  resources :users , only: [:new,:create]
  #routing for users module
  devise_for :users

  namespace :student do
    resources :dashboard
    resources :profiles , only: [:edit,:update]
  end


  namespace :teacher do
    resources :dashboard
  end

  namespace :parent do
    resources :dashboard
  end

  namespace :admin do
    resources :dashboard
  end



end

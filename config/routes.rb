Rails.application.routes.draw do

  root to: 'visitors#index'

  resources :users , only: [:new,:create]
  #routing for users module
  devise_for :users

  namespace :student do
    resources :dashboard
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

  get 'tests/upload', to: 'tests#upload'
  post 'tests/upload_file', to: 'tests#upload_file'



end

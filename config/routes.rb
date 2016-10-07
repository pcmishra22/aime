Rails.application.routes.draw do

  root to: 'visitors#index'

  resources :users , only: [:new,:create]
  #routing for users module
  devise_for :users

  namespace :student do
    root controller: :dashboard, action: :index
  end


  namespace :teacher do
    root controller: :dashboard, action: :index
  end

  namespace :parents do
    root controller: :dashboard, action: :index
  end

  namespace :admin do
    root controller: :dashboard, action: :index
  end



end

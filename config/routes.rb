Rails.application.routes.draw do
  root to: 'visitors#index'

  #routing for users module
  devise_for :users


  namespace :student do
    root controller: :dashboard, action: :index
  end

end

Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'pages*' => 'pages#*', :format => false

  root to: 'visitors#index'

  get '/users/profile/:profile_id', to: 'users#profile'
  resources :users , only: [:index,:new,:create]
  #routing for users module
  devise_for :users

  post '/createAjaxMail', to: 'mailboxes#createAjaxMail'
  resources :mailboxes

  namespace :student do
    resource :dashboard
    resource :profile
    resources :conversations do
      resources :messages
    end


  end
  
  get '/conversations/new/:type/:mid', to: 'conversations#new'
  get '/conversations/:box', to: 'conversations#index'
  resources :messages

  namespace :teacher do
    resource :dashboard
    resource :profile
    resources :conversations do
      resources :messages
    end
    resources :courses do
      resources :schedules
    end
  end

  namespace :guardian do
    resource :dashboard
    resource :profile
    resources :conversations do
      resources :messages
    end
  end

end

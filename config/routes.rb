Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/about'

  get 'pages/aimesays'

  get 'pages/careers'

  get 'pages/contact'

  get 'pages/videos'

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

  end
  
  get '/messages/new/:type/:mid', to: 'messages#new'
  get '/messages/:box', to: 'messages#index'
  resources :messages

  namespace :teacher do
    resource :dashboard
    resource :profile
    resources :courses
    resources :schedules
  end

  namespace :parent do
    resource :dashboard
    resource :profile
  end

end

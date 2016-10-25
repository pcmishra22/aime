Rails.application.routes.draw do

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

  namespace :student do
    post '/profiles/upload_file'
    post '/profiles/social_update'
    resources :dashboard
    resources :profiles , only: [:edit,:update,:upload_file,:social_update]

  end
  
  get '/messages/new/:type/:mid', to: 'messages#new'
  get '/messages/:box', to: 'messages#index'
  resources :messages

  namespace :teacher do
    post '/profiles/upload_file'
    post '/profiles/social_update'
    resources :dashboard
    resources :profiles , only: [:edit,:update,:upload_file,:social_update]
    resources :courses
    resources :schedules
  end

  namespace :parent do
    post '/profiles/upload_file'
    post '/profiles/social_update'
    resources :dashboard
    resources :profiles , only: [:edit,:update,:upload_file,:social_update]
  end

  namespace :admin do
    resources :dashboard
  end


end

Rails.application.routes.draw do
  resources :tutorials

  resources :trackees

  root to: 'visitors#index'
  devise_for :users
  resources :users

  get 'userTrack' => 'trackees#userTrack'
end

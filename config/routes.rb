Rails.application.routes.draw do
  root to: 'application#index'

  devise_for :users
  resources :envfiles
  resources :namespaces
  resources :teams, only: [:index]
  resources :applications, only: [:index]
  resources :environments, only: [:index]

  match "*path", to: "application#index", format: false, via: :get
end

Rails.application.routes.draw do
  root to: 'application#index'

  devise_for :users
  resources :envfiles
  resources :namespaces

  match "*path", to: "application#index", format: false, via: :get
end

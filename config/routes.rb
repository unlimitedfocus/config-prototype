Rails.application.routes.draw do
  devise_for :users
  root to: 'application#index'

  resources :envfiles
  resources :namespaces

  match "*path", to: "application#index", format: false, via: :get
end

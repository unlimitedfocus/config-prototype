Rails.application.routes.draw do
  root to: 'application#index'

  resources :envfiles
  resources :namespaces
end

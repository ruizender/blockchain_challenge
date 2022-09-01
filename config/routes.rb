Rails.application.routes.draw do
  root 'blockchains#index'
  resources :blockchains, only: [:index, :create, :destroy]
end

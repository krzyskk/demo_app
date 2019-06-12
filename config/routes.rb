Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#show'
  mount ActionCable.server, at: '/cable'
  resources :messages, only: [:index, :new, :create]
end

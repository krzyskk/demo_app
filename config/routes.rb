Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#show'
  mount ActionCable.server, at: '/cable'
  resource :messages
end

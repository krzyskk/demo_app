Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#show'
  mount ActionCable.server, at: '/cable'
  resources :messages, only: [ :new, :create]
  namespace :v1 do
    get '/messages', to: 'messages#search'
  end

end

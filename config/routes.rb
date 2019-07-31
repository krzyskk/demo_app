Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#show'
  mount ActionCable.server, at: '/cable'
  resources :messages, only: [:new, :create]
  namespace :v1 do
    post 'auth/login', to: 'sessions#authenticate'
    post 'signup', to: 'users#create'
    resources :rooms do
      resources :messages
    end
    get '/search_message', to: 'messages#search'
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :donations
  resources :confirmations, only: [:new, :create, :index]
  resources :users, only: [:show]
  resources :chatrooms, only: :show
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :reviews, only: [:new, :create, :show]
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end

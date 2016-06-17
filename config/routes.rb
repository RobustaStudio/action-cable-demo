Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'

  resources :tweets
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end

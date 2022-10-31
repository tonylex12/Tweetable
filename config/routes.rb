Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: :callbacks }

  root to: 'tweets#index'

  resources :tweets do
    post "reply", on: :member
  end

  resources :users do
    resources :likes, only: [:create, :destroy]
  end

  get "/users/:id/likes", to: "likes#create"
  get "/users/:id/likes/:id", to: "likes#destroy"
end

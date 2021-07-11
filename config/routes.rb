Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items do
    resources :buyers, only: [:index, :new, :create]
  end

  resources :cards, only: [:new, :create]
end
Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items do
    resources :buyer_records, only: [:index, :new, :create]
  end

end
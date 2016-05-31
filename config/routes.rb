Rails.application.routes.draw do

  devise_for :users
  root 'shows#index'

  get '/products', to: "products#index", as: 'products'
  resources :users, only: [:show]
  resources :shows, only: [:index], shallow: true do
    resources :follows, only: [:create]
    delete "/follows/:id", to: "follows#destroy", as: "delete_follow"
    resources :products
  end

end

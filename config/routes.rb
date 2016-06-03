Rails.application.routes.draw do
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get '/products', to: "products#index", as: 'products'
  resources :users, only: [:show]
  resources :shows, only: [:index], shallow: true do
    resources :follows, only: [:create]
    delete "/follows", to: "follows#destroy"
    resources :products
  end

end

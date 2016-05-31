Rails.application.routes.draw do

  root 'shows#index'

  get '/products', to: "products#index", as: 'products'
  resources :shows, only: [:index], shallow: true do
    resources :products
  end

end

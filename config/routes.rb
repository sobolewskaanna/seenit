Rails.application.routes.draw do

  root 'shows#index'

  resources :shows, only: [:index, :create, :show], shallow: true do
    resources :products
  end

end

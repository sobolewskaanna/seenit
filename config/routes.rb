Rails.application.routes.draw do

  root 'shows#index'

  resources :shows, only: [:index], shallow: true do
    resources :products
  end

end

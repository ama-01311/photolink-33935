Rails.application.routes.draw do
  devise_for :users
  root to: "photos#index"
  resources :photos do
    resources :orders, only: [:index, :create]
    resources :order_options, only:[:index, :create] 
  end
end

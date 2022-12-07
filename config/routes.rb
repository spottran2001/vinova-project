Rails.application.routes.draw do
  get 'site/index'
  root "site#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products
    resources :product_photos, only: [:destroy]
end

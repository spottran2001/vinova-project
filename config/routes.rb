Rails.application.routes.draw do
  get 'site/index'
  root "site#index"
  devise_for :users, path: 'user'
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions',
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products do
    resources :product_photos
    
  end
  resources :users

  resources :site do 
    collection do
      get 'collections'
      post 'add_to_cart'

      resources :orders do 
        resources :payments, only: [:create, :new]
      end      

      resources :checkouts, only: [:create, :new]
      resources :carts
      resources :cart_details
    end  
  end
end

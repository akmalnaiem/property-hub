Rails.application.routes.draw do
  # get "about/show"
  # get "about/edit"
  # get "about/update"
  # get "about/destroy"
  resources :property_types do
    collection do
      get :by_category
    end
  end
  resources :property_categories
  # get "blogs/index"
  # get "blogs/show"
  # get "blogs/new"
  # get "blogs/create"
  # get "blogs/edit"
  # get "blogs/update"
  # get "blogs/destroy"
  # get "properties/index"
  # get "properties/show"
  # get "properties/new"
  # get "properties/create"
  # get "properties/edit"
  # get "properties/update"
  # get "properties/destroy"
  root "home#index"
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  devise_for :users

  resources :properties do
    member do
      get :download_csv
      get :download_image
    end
  end
  resources :blogs
  resources :abouts
  resources :home

  # get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  post "/contact", to: "pages#submit_contact"
end

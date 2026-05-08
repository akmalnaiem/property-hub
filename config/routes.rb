Rails.application.routes.draw do
  resources :property_types do
    collection do
      get :by_category
    end
  end
  resources :property_categories

  root "home#index"

  devise_for :users
  ActiveAdmin.routes(self)

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :properties do
    member do
      get :download_csv
      get :download_image
    end
  end
  resources :blogs
  resources :abouts
  resources :home

  get "/contact", to: "pages#contact"
  post "/contact", to: "pages#submit_contact"
end

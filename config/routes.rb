Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "students#index"

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :users, only: [:index, :destroy]
  resources :settings, only: [:index] 
  resources :plans
  resources :gyms, only: [:update]

  resources :students do
    resources :payments, only: [ :index, :new, :create, :destroy ]
  end
  
end

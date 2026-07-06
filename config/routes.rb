Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Rota raiz
  root "students#index"

  # devise_for :users, skip: [ :registrations ]

  resource :student do
    resources :payments, only: [ :index, :new, :create, :destroy ]
  end
end

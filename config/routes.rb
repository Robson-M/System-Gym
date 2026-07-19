Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "students#index"
  devise_for :users

  resources :students do
    resources :payments, only: [ :index, :new, :create, :destroy ]
  end

end

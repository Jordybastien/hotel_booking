Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "hotels#index"

  resources :hotels do
    resources :reservations, only: [:create, :new]
  end
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "hotels#index"
  get 'hotels/index_lazy', to: 'hotels#index_lazy'

  resources :hotels do
    get 'filter_rooms', to: 'reservations#filter_rooms'
    resources :reservations, only: [:create, :new]
  end
end

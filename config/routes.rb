Rails.application.routes.draw do
  devise_for :users
  root to: 'vehicles#index'
  resources :vehicles, only: %i[index new create show] do
    resources :bookings, only: %i[create new]
  end
    resource :bookings, only: %i[index show destroy update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

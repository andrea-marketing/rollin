Rails.application.routes.draw do
  devise_for :users
  root to: 'vehicles#index'
  resources :vehicles do
    resources :bookings, only: %i[create new]
  end
    resources :bookings, only: %i[index show destroy update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'vehicles#index'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  resources :vehicles do
    resources :bookings, except: [:destroy]
  end
  resources :bookings, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

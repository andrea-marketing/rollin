Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'home', to: 'pages#home'
  resources :vehicles do
    resources :bookings, except: [:destroy]
  end
    resources :bookings, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

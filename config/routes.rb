Rails.application.routes.draw do
  devise_for :users
  root to: 'vehicles#index'
  resources :vehicles do
    resources :bookings, except: [:destroy] do
      member do
        patch :accept, :reject
      end
    end
  end
    resources :bookings, only: [:destroy]
end

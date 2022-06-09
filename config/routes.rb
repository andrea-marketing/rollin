Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get 'home', to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :vehicles do
    resources :bookings, except: [:destroy] do
      member do
        patch :accept, :reject
      end
    end
  end
   resources :bookings, only: [:destroy]
end

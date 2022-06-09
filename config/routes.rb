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

  patch "profile/:id/accept", to: "bookings#accept", as: :accept_this_booking
  patch "profile/:id/reject", to: "bookings#reject", as: :reject_this_booking

  resources :bookings, only: [:destroy]

  get 'my_bookings', to: 'bookings#my_bookings'
end

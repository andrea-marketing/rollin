Rails.application.routes.draw do
  devise_for :users
  root to: 'vehicles#index'
  resources :vehicles, only: %i[index new create show] do
    resources :bookings, only: %i[new create update edit]
  end
    resource :bookings, only: %i[index show destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

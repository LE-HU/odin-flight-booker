Rails.application.routes.draw do
  resources :flights, only: [:index]
  resources :bookings, only: [:show, :new, :create]
  root "flights#index"
end

# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/create'
  resources :bookings
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "bookings#index"
end

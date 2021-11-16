Rails.application.routes.draw do
  devise_for :users
  root to: 'toilets#index'
  resources :toilets, only: [:new, :show, :create] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
  resources :users, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'toilets#index'
  get '/dashboard', to:'pages#dashboard', as: :dashboard
  resources :toilets, only: [:new, :show, :create] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy] do
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'vehicles#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :vehicles, only: [:index, :show, :new, :create] do
    member do
      resources :bookings, only: [:index, :new, :create]
    end
  end
  # resources :bookings, e: [:index, :destroy]

  # resources :dashboards, only: :index
  mount Attachinary::Engine => "/attachinary"
end

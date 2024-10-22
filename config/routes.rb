Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Hotels routes, including nested reviews routes
  resources :hotels, only: [:index, :show] do
    resources :reports, only: [:index, :create]
    resources :favourites, only: :create
  end

  resources :favourites, only: [ :index, :destroy ]

  # Emergency contacts route
  get "emergency_contacts/index"
  get 'emergency_contacts', to: 'emergency_contacts#index'

  # Reveal health status on /up
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA service worker and manifest routes
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest
end

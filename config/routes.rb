Rails.application.routes.draw do
  devise_for :users

  # Root route
  root to: "pages#home"

  # Health check route for monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Emergency contacts routes
  resources :emergency_contacts, only: [:index]

  # Safety reports and hotels routes
  resources :safety_reports # This allows all RESTful actions
  resources :hotels, only: [:index]
end

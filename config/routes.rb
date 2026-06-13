Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "sessions#new"

  # Authentication
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "signup", to: "users#new"
  post "signup", to: "users#create"

  # User dashboard and permit requests
  get "dashboard", to: "permit_requests#index"
  resources :permit_requests, only: [:new, :create, :show]

  # Admin dashboard and actions
  get "admin", to: "admin#index", as: :admin_dashboard
  post "admin/permit_requests/:id/approve", to: "admin#approve", as: :approve_permit_request
  post "admin/permit_requests/:id/reject", to: "admin#reject", as: :reject_permit_request

  get "up" => "rails/health#show", as: :rails_health_check
end

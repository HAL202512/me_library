Rails.application.routes.draw do
  root "users#new"

  resources :users, only: %i[new create]
  resources :user_sessions, only: %i[new create]
  resource :user_session, only: %i[destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
Rails.application.routes.draw do
  get "home/index"
  root "home#index"

  resources :users, only: %i[new create]
  resources :user_sessions, only: %i[new create]
  resource :user_session, only: %i[destroy]
  resources :memories, only: %i[new create edit update destroy] do
    resources :reflections, only: %i[new create edit update destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
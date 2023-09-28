Rails.application.routes.draw do
  resources :tickets, only: [:index, :show, :create]

  root "tickets#index"
end

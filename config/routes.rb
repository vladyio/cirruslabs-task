Rails.application.routes.draw do
  resource :tickets, only: [:index, :create]

  root "tickets#index"
end

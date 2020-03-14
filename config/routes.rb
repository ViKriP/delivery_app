Rails.application.routes.draw do
  root 'couriers#index'

  resources :couriers do
    resources :packages, only: %i[create]
  end
end

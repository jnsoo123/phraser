Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :phrases, only: [:index, :create]

  root to: "phrases#index"
end

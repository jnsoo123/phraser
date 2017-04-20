Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :phrases, only: [:index, :create, :destroy]

  post "/mark_favorite/:id" => "phrases#mark_favorite", as: :mark_favorite

  root to: "phrases#index"
end

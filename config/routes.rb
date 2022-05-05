Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :skatespots, only: [:index, :show, :create, :new, :edit] do
    resources :conversations, only: :create
  end
  get 'dashboard', to: 'pages#dashboard'
end

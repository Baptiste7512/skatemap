Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :skatespots, only: [:index, :show, :create, :new, :edit] do
    resources :conversations, only: :create
  end
  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

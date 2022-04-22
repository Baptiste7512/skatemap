Rails.application.routes.draw do
  devise_for :users
  root to: 'skatespots#index'
  resources :skatespots, only: [:index, :show, :create, :new, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

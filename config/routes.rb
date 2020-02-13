Rails.application.routes.draw do
  get 'static_pages/contact'
  get 'static_pages/team'
  resources :gossips
  root 'gossips#index'
  resources :users
  resources :cities, only: [:index, :show]
  resources :gossips do
      resources :comments
  end
  resources :sessions, only: [:new, :create, :destroy]
end

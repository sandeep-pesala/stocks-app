Rails.application.routes.draw do
  resources :investors
  get 'users/my_portfolio'

  devise_for :users
  resources :welcomes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcomes#index'
  get 'my_portfolio', to: 'investors#my_portfolio'
  get 'search_stock', to: 'stocks#search'
end

Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :investors

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'investors#index'
  get 'my_portfolio', to: 'investors#my_portfolio'
  get 'search_stock', to: 'stocks#search'
end

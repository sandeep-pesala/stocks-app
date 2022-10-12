Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :investors

  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'investors#index'
  get 'my_portfolio', to: 'investors#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'friends', to: 'investors#my_friends'
  get 'search_user', to: 'investors#search_users'
  get 'users', to: 'investors#list_all_users'
  post 'follow', to: 'investors#follow_the_investor'
  delete 'unfollow', to: 'investors#unfollow_the_investor'
  get 'investors/:id/email', to: 'investors#compose_email', as: 'compose_email'
  post 'investors/:id/email', to: 'investors#send_email', as: 'send_email'
end

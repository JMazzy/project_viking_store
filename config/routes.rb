Rails.application.routes.draw do
  get 'categories/new'

  namespace :admin do
    get '/' => 'categories#index'
    resources :categories
    resources :products
    resources :users
    resources :addresses
    resources :orders
  end

  root 'products#index'

  resources :products
  resources :users, except: [:index]
  resource :cart, only: [:show]

  get '/dashboard' => 'dashboard#index'
  get '/dashboard/orders_by_day' => 'dashboard#orders_by_day'
  get '/dashboard/orders_by_week' => 'dashboard#orders_by_week'
end

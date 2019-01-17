Rails.application.routes.draw do
  get 'admins/show'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :artists, controllers: {
    sessions:      'artists/sessions',
    passwords:     'artists/passwords',
    registrations: 'artists/registrations'
  }

  get    '/admins/user_history',    to: 'admins#user_history'
  get    '/admins/user_index',    to: 'admins#user_index'
  get    '/admins/user_search',    to: 'admins#user_search'
  get    '/admins/user_history',    to: 'admins#user_history'
  resources :admins, only: [:show, :edit, :update]

  get    '/users/help',    to: 'users#help'
  get    '/users/address',    to: 'users#address'
  post   '/users/address',   to: 'users#create_address'
  get    '/users/select',    to: 'users#select'
  resources :users, only: [:show, :edit, :update, :destroy]

  # get    '/artists/search/',    to: 'artists#search'
  get    '/artists/history',    to: 'artists#product_history'
  patch  '/artists/history',    to: 'artists#update_history'
  get    '/artists/index',    to: 'artists#index'
  resources :artists, only: [:index, :show, :edit, :update, :destroy]

    resources :products, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :update, :destroy]
  end

  post   '/cart_items/',    to: 'cart_items#add_item'
  patch  '/cart_items/:id',    to: 'cart_items#update_item'
  delete '/cart_items/:id',    to: 'cart_items#destroy_item'

  resources :carts, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'addresses/show'
  root to: 'products#index'

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
  resources :admins, only: [:show, :edit, :update]

  get    '/users/help',    to: 'users#help'
  get    '/users/confirm_order',    to: 'users#confirm_order'
  get    '/users/address/new',   to: 'users#new_address'
  post   '/users/address',   to: 'users#create_address'
  get    '/users/address/:id/edit',   to: 'users#edit_address'
  patch  '/users/address/:id',   to: 'users#update_address'
  delete '/users/address/:id',   to: 'users#destroy_address'
  get    '/users/session_select',    to: 'users#session_select'
  get    '/users/registration_select',    to: 'users#registration_select'
  get    '/users/thanks',    to: 'users#thanks'
  resources :users, only: [:show, :edit, :update, :destroy]

  # get    '/artists/search/',    to: 'artists#search'
  get    '/artists/history',    to: 'artists#product_history'
  patch  '/artists/history',    to: 'artists#update_history'
  get    '/artists/index',    to: 'artists#index'
  resources :artists, only: [:index, :show, :edit, :update, :destroy]

  get    '/products/index',    to: 'products#index'
    resources :products, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :update, :destroy]
  end

  post   '/cart_items/',    to: 'cart_items#add_item'
  patch  '/cart_items/:id',    to: 'cart_items#update_item'
  delete '/cart_items/:id',    to: 'cart_items#destroy_item'

  patch  '/carts/:id',    to: 'users#buy'
  resources :carts, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

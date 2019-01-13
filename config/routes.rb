Rails.application.routes.draw do
  get 'admins/show'
  devise_for :artists
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

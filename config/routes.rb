Rails.application.routes.draw do
  get 'my_account/index'
  get '/settings', to: 'settings#index'
  get '/dashboard', to: 'dashboard#index'
  get 'users/index'
  get '/add_user', to: 'users#new'
  get '/view_users', to: 'users#show'
  get '/art_initiation', to: 'art_initiation#index'
  get '/case_listing', to: 'case_listing#index'
  get '/', to: 'dashboard#index'

  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

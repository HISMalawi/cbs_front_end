Rails.application.routes.draw do
  get 'client_case_profile/index'
  get 'client_case_profile/show'
  match '/sign_in', to: 'users#sign_in', via: [:get, :post]
  get '/sign_up', to: 'users#sign_up'
  get '/sign_out', to: 'users#sign_out'
  get '/password_recovery', to: 'users#password_recovery'
  get '/my_account', to: 'my_account#index'
  get '/settings', to: 'settings#index'
  get '/dashboard', to: 'dashboard#index'
  get 'users/index'
  match '/add_user', to: 'users#new', via: [:get, :post]
  get '/view_users', to: 'users#show'
  match '/art_initiation', to: 'art_initiation#index', via: [:get, :post]
  match '/case_listing', to: 'case_listing#index', via: [:get, :post]
  match '/client_case_profile/:id', to: 'client_case_profile#index', via: [:get, :post]
  get '/', to: 'dashboard#index'

  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

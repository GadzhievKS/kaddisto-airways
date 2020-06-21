Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      sign_in: 'users/login',
      sign_out: 'users/logout',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }

  resources :tickets
  resources :aircrafts
  resources :airlines
  resources :airports
  resources :my_tickets do
    resources :tickets
  end


  root 'application#index'

end

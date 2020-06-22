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

  resources :flights
  resources :tickets

  root 'flights#index'
end

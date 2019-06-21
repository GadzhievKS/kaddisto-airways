Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      sign_in: 'users/login',
      sign_out: 'users/logout',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
end

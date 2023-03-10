Rails.application.routes.draw do
  resources :time_trackers
  get 'time_trackers/index'
  resources :tenants
  resources :appointments

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  constraints subdomain: /.*/ do
  end

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "application#redirect"
end

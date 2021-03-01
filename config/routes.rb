Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  constraints subdomain: /.*/ do
  resources :schedules
  end

  resources :accounts

  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "accounts#home"
end

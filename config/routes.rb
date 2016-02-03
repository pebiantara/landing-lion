Rails.application.routes.draw do
  root 'home#index'

  resources :subscriptions, only: [:create]
  match "/pages/:page_id" => 'pages#show', as: :show_page, via: [:get]

  match "/sign_up" => "registrations#new", as: :sign_up, via: [:get]
  match "/sign_up" => "registrations#create", as: :sign_up_create, via: [:post]
  match "/forgot_password" => "passwords#create", as: :forgot_password, via: [:post]
  match "/sign_in" => "sessions#create", as: :sign_in, via: [:post]
  match "/building_droplet" => "registrations#building_droplet", as: :building_droplet, via: [:get]
  match "/checking_droplet" => "registrations#checking_droplet", as: :checking_droplet, via: [:get]
end
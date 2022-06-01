Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get "/orders/:id/confirmation", to: "orders#confirmation", as: :order_confirmation

  resources :offers, only: [:index, :show, :new, :create]
  resources :orders, only: [:index, :confirmation], as: :order_confirmation
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

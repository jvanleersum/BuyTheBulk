Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get "/orders/:id/confirmation", to: "orders#confirmation", as: :order_confirmation

  resources :offers, only: [:index, :show, :new, :create] do
    resources :orders, only: [:confirmation, :new], as: :order_confirmation
  end
  resources :orders,
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

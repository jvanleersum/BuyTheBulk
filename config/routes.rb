Rails.application.routes.draw do
  # require "sidekiq/web"
  # authenticate :user, ->(user) { user.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  devise_for :users
  root to: 'pages#home'
  # get "/orders/:id/confirmation", to: "orders#confirmation", as: :order_confirmation
  delete "/offers", to: 'offers#destroy_all', as: :destroy_all
  resources :offers do
    resources :comments, only: [ :create ]
    resources :orders, only: [ :create ]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  resources :businesses, only: [ :new, :create, :edit, :update ]
  resources :orders, only: [ :index, :show, :destroy ] do
    get "/confirmation", to: "orders#confirmation"
  end
end

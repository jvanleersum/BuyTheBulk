Rails.application.routes.draw do
  # require "sidekiq/web"
  # authenticate :user, ->(user) { user.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  devise_for :users
  #get '/search', to: 'pages#home', as: :search
  root to: 'pages#home'
 # root to: 'pages#splash'
  # get "/orders/:id/confirmation", to: "orders#confirmation", as: :order_confirmation
  delete "/offers", to: 'offers#destroy_all', as: :destroy_all
  get "/landing", to: 'pages#landing'
  resources :offers do
    resources :comments, only: [ :create ]
    resources :orders, only: [ :create ]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  resources :businesses, only: [ :show, :new, :create, :edit, :update ]
  resources :orders, only: [ :index, :show, :destroy ] do
    get "/confirmation", to: "orders#confirmation"
    patch "/accept", to: "orders#accept"
    patch "/reject", to: "orders#reject"
  end
end

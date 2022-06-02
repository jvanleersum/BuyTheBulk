Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :orders, only: [ :index, :show, :destroy ] do
    get "/confirmation", to: "orders#confirmation"
  end
  delete "/offers", to: 'offers#destroy_all', as: :destroy_all
  resources :offers do
    resources :orders, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

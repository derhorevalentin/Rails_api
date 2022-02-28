Rails.application.routes.draw do
 root "articles#index"
 resources :articles
 resources :users, only: [:create]
 post "/login", to: "users#login"
 get "/auto_login", to: "users#auto_login"
end

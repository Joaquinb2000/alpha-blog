Rails.application.routes.draw do
  root :to => "pages#home"
  get "about", to: "pages#about"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#delete"

  resources :articles
  get "signup", to: "users#new"
  resources :users, except: [ :new ]

  resources :categories, except [ :destroy ]
end

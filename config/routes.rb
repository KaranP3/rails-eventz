# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
# root "articles#index"
Rails.application.routes.draw do
  resources :events
  root 'home#index'
  get 'about', to: 'about#index'
end

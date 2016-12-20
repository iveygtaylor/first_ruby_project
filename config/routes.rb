Rails.application.routes.draw do
  resources :customizations
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resources :sessions, only: [:new, :create, :destroy]
  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'

  get '/' => "home#index"
  get '/search' => 'home#search'
  root 'home#index'
end

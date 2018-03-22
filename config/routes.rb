Rails.application.routes.draw do

  root 'pages#index'
  get 'about', to: 'pages#about', as: 'person'

  resources :articles
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  resources :users, except: [:new]
end

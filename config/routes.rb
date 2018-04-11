Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root 'pages#index'
  get 'about', to: 'pages#about', as: 'person'

  resources :articles
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]
end

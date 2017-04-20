Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  get 'new_task', to: 'tasks#new'
  
  resources :users, only: [:index, :show, :new, :create]

  resources :tasks #, only: [:create, :destroy, :show, :update]
  
end


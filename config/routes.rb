Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  get 'albums/index' => 'albums#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:new, :create, :edit, :update]
  resources :memories, only: [:new, :create, :edit, :update, :destroy]
end

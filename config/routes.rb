Rails.application.routes.draw do

  root                'static_pages#home'
  get 'help'       => 'static_pages#help'
  get 'about'      => 'static_pages#about'
  get 'signup'     => 'users#new'
  get 'signin'     => 'sessions#new'
  post 'signin'    => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
  resources :users 
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :items,               only: [:create, :destroy]
end

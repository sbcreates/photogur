Rails.application.routes.draw do

  root 'pictures#index'

  get 'login' => 'sessions#new', :as => :login

  delete 'logout' => 'sessions#destroy', :as => :logout

  resources :pictures
  resource :users, only: %i(create new edit update)
  resource :sessions, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end

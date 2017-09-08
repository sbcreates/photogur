Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root 'pictures#index'
  resources :pictures
  resource :users, only: %i(create new edit update)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end

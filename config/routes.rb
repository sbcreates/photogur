Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #localhost:3000 will now show '/pictures'
  root 'pictures#index'
  #index.html.erb
  get 'pictures' => 'pictures#index'

  #create a new picture
  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new'

  #show.html.erb
  get 'pictures/:id' => 'pictures#show'

  #edit pictures
  get 'picture/:id/edit' => 'pictures#edit'
  patch 'picture/:id' => 'pictures#update'

end

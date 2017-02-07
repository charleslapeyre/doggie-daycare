Rails.application.routes.draw do
  # resources :dogs, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  # use one of code to generate all 7 of the routes
  resources :owners
  resources :dogs

  root 'dogs#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

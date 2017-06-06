Rails.application.routes.draw do
  get 'products/search'
  get 'products/show'
  post 'products/preview'

  devise_for :users
  resources :lists
  root 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

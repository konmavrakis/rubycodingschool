Rails.application.routes.draw do
  get 'products/search'
  get 'products/show'
  get 'products/preview'
  
  #post 'products/preview', to: redirect('/products/preview/#{sku}')
  get 'products/preview/:sku', to: 'products#preview'


  devise_for :users
  resources :lists
  root 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

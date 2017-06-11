Rails.application.routes.draw do
  get 'products/search'
  get 'products/show'
  get 'products/preview'
  
  #post 'products/preview', to: redirect('/products/preview/#{sku}')
  get 'products/preview/:sku', to: 'products#preview'

  post 'products/addtolist', to: 'products#add_product_to_list'

  devise_for :users
  resources :lists
  root 'pages#home'
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

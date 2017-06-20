Rails.application.routes.draw do

  get 'products/search'
  get 'products/show'
  get 'products/preview'
  resources :lists

  #post 'products/preview', to: redirect('/products/preview/#{sku}')
  get 'products/preview/:sku', to: 'products#preview'
  delete 'list/remove_product_list', to: 'lists#remove_product_list'

  post 'products/addtolist', to: 'products#add_product_to_list'

  devise_for :users
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :product_lists, except: [:index, :new, :show]
  post 'product_lists/create', to: 'product_lists#create'
  post 'product_lists/increase_quantity', to: "product_lists#increase_quantity"
  post 'product_lists/decrease_quantity', to: "product_lists#decrease_quantity"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

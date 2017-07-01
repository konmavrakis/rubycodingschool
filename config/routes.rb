Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'products/search'
  get 'products/show'
  get 'products/preview'
  resources :lists
  resources :product_lists
  #post 'products/preview', to: redirect('/products/preview/#{sku}')
  get 'products/preview/:sku', to: 'products#preview'
  put 'list/removeproduct', to: 'lists#remove_product'

  post 'products/addtolist', to: 'products#add_product_to_list'

  devise_for :users
  root 'pages#home'
  get 'about', to: 'pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

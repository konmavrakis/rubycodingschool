Rails.application.routes.draw do
  get 'products/search'
  get 'products/show'
  get 'products/preview'
  resources :lists

  #post 'products/preview', to: redirect('/products/preview/#{sku}')
  get 'products/preview/:sku', to: 'products#preview'
  put 'list/removeproduct', to: 'lists#RemoveProduct'


  devise_for :users
  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

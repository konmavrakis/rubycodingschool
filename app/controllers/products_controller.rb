class ProductsController < ApplicationController
  before_action :authenticate_user!
  include SkroutzApi

  def search
  end

  def show
  end

  def add_product_to_list
    # product_lists

    sku_id    = params[:sku_id]
    product   = Product.where('skroutz_id=?', sku_id).first

    # check if product exists
    if product.nil? 
      product = Product.create(skroutz_id: sku_id)
    end   

    # get list
    list  = List.find(params[:list])

    # check product in list 
    unless list.products.include?(product)
      # add to list 
      list.products << product

      redirect_to( products_preview_path(sku: sku_id) , alert: 'WOW! You just added a produt to ' + list.name + ' list!'  )
 
    else

      # send error message  
      redirect_to(products_preview_path(sku: sku_id), alert: 'SKU is already in the list' ) 

    end

  end
  

  def preview
    sku_id = params[:sku]
    @sku = SkroutzApi.find_sku(sku_id)
    @lists = List.where('user_id=?',current_user.id )
    rescue Skroutz::ResourceNotFound
      redirect_to(products_search_path, alert: "SKU not found.")
  end
end

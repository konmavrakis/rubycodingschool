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
    product = Product.where('skroutz_id=?', sku_id); 

    if product.empty? 
      product = Product.new
      product.skroutz_id = sku_id
      product.save()
    end 

    list_id   = params[:list]

    # check for existing product 
    product_list = ProductList.new()



    # debugger
    render html: 'test'

  end
  

  def preview
    sku_id = params[:sku]
    @sku = SkroutzApi.find_sku(sku_id)
    @lists = List.where('user_id=?',current_user.id )
    rescue Skroutz::ResourceNotFound
      redirect_to(products_search_path, alert: "SKU not found.")
  end
end

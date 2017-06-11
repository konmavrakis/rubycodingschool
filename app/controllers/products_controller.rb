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
    product = Product.where('skroutz_id=?', sku_id)
    list = List.find(params[:list])

    if product.empty? 
      product = Product.create(skroutz_id: sku_id)
    end   

    unless List.first(params[:id]).products.include?(product)
      list.products << product
    end

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

class ProductListsController < ApplicationController
  include SkroutzApi

  def create
    sku = SkroutzApi.find_sku(params[:sku_id])
    product = Product.find_by(skroutz_id: sku.id)
    list = List.find(params[:list_id])
    quantity_params = params[:quantity].to_i


    # Create new product if there isnt product with sku_id in Product.all
    unless product
      product = Product.create(skroutz_id: sku.id)
    end

    # if list include the product, then add the quantity
    if list.products.include? product
      product_list = list.product_lists.find_by(product_id: product.id)
      product_list_quantity = product_list.quantity
      product_list.update(quantity: (quantity_params + product_list_quantity))
    else
      ProductList.create(list_id: list.id, product_id: product.id, quantity: quantity_params)
    end

    redirect_to list_path(list)
  end

  def destroy
    @product_list = ProductList.find(params[:product_list_id]).delete
    @product_price = params[:product_price].to_f

    lst = List.find(@product_list.list_id)

    respond_to do |format|
      format.html { redirect_to lst, notice: 'List was successfully destroyed.' }
      format.js
    end
  end

  def increase_quantity
    @product_list = ProductList.find(params[:id])
    @product_price = params[:product_price].to_f
    @product_list.increase

    respond_to do |format|
      format.html { redirect_to List.find(@product_list.list_id) }
      format.js
    end
  end

  def decrease_quantity
    @product_list = ProductList.find(params[:id])
    @product_price = params[:product_price].to_f
    if @product_list.quantity > 1
      @product_list.decrease

      respond_to do |format|
        format.html { redirect_to List.find(@product_list.list_id) }
        format.js
      end
    end
  end
end

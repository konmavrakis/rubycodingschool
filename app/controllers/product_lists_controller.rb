class ProductListsController < ApplicationController
  def create
    sku_id = params[:sku_id]
    list = List.find(params[:list])
    quantity = params[:quantity].to_i
    product_list = ProductList.find_by(list_id: list.id, sku_id: sku_id)
    if product_list 
      product_list.quantity = product_list.quantity + quantity
      product_list.save! 
    else 
      ProductList.create(list_id: list.id, sku_id: sku_id, quantity: quantity) 
    end
    redirect_to list_path list
  end

  def destroy
		ProductList.find_by(sku_id: params[:sku_id], list_id: params[:list_id]).delete
		redirect_to :back 
  end

end

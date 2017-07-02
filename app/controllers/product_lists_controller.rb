class ProductListsController < ApplicationController

  include SkroutzApi

  def create
    sku_id = params[:sku_id]
    list = List.find(params[:list])
    quantity = params[:quantity]
    product_list = ProductList.find_by(list_id: list.id, sku_id: sku_id)
    if product_list 
      product_list.quantity = product_list.quantity + quantity.to_i
      product_list.save!
      redirect_to( list , notice: 'You just increased the quantity of ' + SkroutzApi.find_sku(sku_id).name + ' by ' + quantity.to_s + '.')
    else 
      ProductList.create(list_id: list.id, sku_id: sku_id, quantity: quantity)
      redirect_to( list , notice: 'You just added ' + SkroutzApi.find_sku(sku_id).name  + '  to ' + list.name + ' list!'  ) 
    end    
  end

  def destroy
    list = List.find(params[:list_id])
    sku_id = params[:sku_id]
    
    ProductList.find_by(sku_id: sku_id, list_id: list.id).delete
    
    redirect_to( list , notice: 'You just removed ' + SkroutzApi.find_sku(sku_id).name  + '  from ' + list.name + ' list!'  )
  end

  def update
    list = List.find(params[:list_id])
    sku_id = params[:sku_id]
    quantity = params[:quantity]

    ProductList.find_by(list_id: list.id, sku_id: sku_id).update(quantity: quantity)

    respond_to do |format|   
      format.html { redirect_to :back, notice: 'ok' }
      format.json { render json: {resp: 'ok', name: SkroutzApi.find_sku(sku_id).name, quantity: quantity } }          
    end
  end

end

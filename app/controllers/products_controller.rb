class ProductsController < ApplicationController
  include SkroutzApi

  def search
  end

  def show
  end

  def preview
    sku_id = params[:q]
    @sku = SkroutzApi.find_sku(sku_id)
    @name = @sku[0]['name']
    #debugger
  end
end

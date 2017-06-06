class ProductsController < ApplicationController
  include SkroutzApi

  def search
  end

  def show
  end

  def preview
    sku_id = params[:q]
    sku = SkroutzApi.find_sku(sku_id)
    debugger
  end
end

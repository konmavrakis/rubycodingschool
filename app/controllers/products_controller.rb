class ProductsController < ApplicationController
  before_action :authenticate_user!
  include SkroutzApi

  def search
  end

  def show
  end

  def preview
    sku_id = params[:sku]
    @sku = SkroutzApi.find_sku(sku_id)
    rescue Skroutz::ResourceNotFound
      redirect_to(products_search_path, alert: "SKU not found.")
  end
end

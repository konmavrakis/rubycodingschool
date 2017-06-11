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
  end
end

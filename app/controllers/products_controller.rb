class ProductsController < ApplicationController
  before_action :authenticate_user!
  include SkroutzApi

  def search
  end

  def show
  end

  def preview
    sku_id = params[:q]
    @sku = SkroutzApi.find_sku(sku_id)
    #debugger
  end

  private

  def product_params
    params.require(:product).permit(:q)
  end
end

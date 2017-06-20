module ListsHelper
  def total_price(skus)
    skus.inject(0) { |sum, sku| sum + sku[:sku].price_min * sku[:product_list].quantity }
  end

  def sum_price(sku)
    sku[:sku].price_min * sku[:product_list].quantity 
  end
end

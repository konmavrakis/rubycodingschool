module ListsHelper
  def total_price(skus)
    final_price = skus.inject(0) { |sum, sku| sum + sku[:sku].price_min * sku[:product_list].quantity }
    if final_price < 0.1
      0.00
    else
      final_price
    end
  end

  def sum_price(sku)
    sku[:sku_price].to_f * sku[:quantity]
  end
end

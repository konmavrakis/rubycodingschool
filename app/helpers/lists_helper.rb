module ListsHelper

	def total_price(quantity, price)
		quantity * price
	end

	def list_total_price(skus)
		total_price = 0
		skus.each do |s|
			price = s[:sku].price_min * s[:quantity]
			total_price += price
		end
		total_price
	end

end

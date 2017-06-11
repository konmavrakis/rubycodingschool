module SkroutzApi
	attr_reader :sku

	def self.find_sku(sku)
		skroutz = Skroutz::Client.new(Rails.application.secrets.skroutz_client_id, Rails.application.secrets.skroutz_client_secret)
		@result = skroutz.skus.find "#{sku}"
	end
end

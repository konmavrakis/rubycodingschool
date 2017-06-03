class AddProductReferenceToProductList < ActiveRecord::Migration[5.0]
  def change
    add_reference :product_lists, :products, foreign_key: true
  end
end

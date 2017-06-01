class AddProductReferenceToProductList < ActiveRecord::Migration[5.0]
  def change
    add_reference :product_lists, :ProductList, foreign_key: true
  end
end

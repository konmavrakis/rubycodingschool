class AddListReferenceToProductList < ActiveRecord::Migration[5.0]
  def change
    add_reference :product_lists, :lists, foreign_key: true
  end
end

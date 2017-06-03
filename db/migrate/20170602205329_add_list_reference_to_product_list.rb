class AddListReferenceToProductList < ActiveRecord::Migration[5.0]
  def change
    add_reference :product_lists, :list, foreign_key: true
  end
end

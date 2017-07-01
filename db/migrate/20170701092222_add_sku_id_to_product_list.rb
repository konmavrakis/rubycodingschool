class AddSkuIdToProductList < ActiveRecord::Migration[5.0]
  def change
    add_column :product_lists, :sku_id, :integer
  end
end

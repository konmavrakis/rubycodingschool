class RemoveColumnsFromProductList < ActiveRecord::Migration[5.0]
  def change_table:product_lists
    remove_column :product_lists, :list_id
    remove_column :product_lists, :product_id
  end
end

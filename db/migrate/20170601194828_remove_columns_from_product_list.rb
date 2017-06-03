class RemoveColumnsFromProductList < ActiveRecord::Migration[5.0]
  def change
    remove_column :product_lists, :list_id, :integer
    remove_column :product_lists, :product_id, :integer
  end
end

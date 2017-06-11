class RemovePriceNameCategoryFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :price, :decimal
    remove_column :products, :name, :string
    remove_column :products, :category, :string
  end
end

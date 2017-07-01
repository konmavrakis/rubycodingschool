class AddQuantity < ActiveRecord::Migration[5.0]
  def change
    add_column :product_lists, :quantity, :integer 
  end
end

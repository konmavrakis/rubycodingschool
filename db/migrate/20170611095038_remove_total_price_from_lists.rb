class RemoveTotalPriceFromLists < ActiveRecord::Migration[5.0]
  def change
    remove_column :lists, :total_price, :decimal
  end
end

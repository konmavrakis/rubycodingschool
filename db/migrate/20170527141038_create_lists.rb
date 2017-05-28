class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.boolean :active
      t.decimal :total_price

      t.timestamps
    end
  end
end

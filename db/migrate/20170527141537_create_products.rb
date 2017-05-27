class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.int :skroutz_id
      t.string :name
      t.string :category
      t.decimal :price

      t.timestamps
    end
  end
end

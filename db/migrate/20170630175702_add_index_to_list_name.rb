class AddIndexToListName < ActiveRecord::Migration[5.0]
  def change
    add_index :lists, :name
  end
end

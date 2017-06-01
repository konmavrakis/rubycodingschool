class AddListReferenceToProductlist < ActiveRecord::Migration[5.0]
  def change
    add_reference :productlists, :ProductList, foreign_key: true
  end
end

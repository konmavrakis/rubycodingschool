class AddUserReferenceToList < ActiveRecord::Migration[5.0]
  def change
    add_reference :lists, :users, foreign_key: true
  end
end

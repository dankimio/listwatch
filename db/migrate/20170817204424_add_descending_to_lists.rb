class AddDescendingToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :descending, :boolean, default: false
  end
end

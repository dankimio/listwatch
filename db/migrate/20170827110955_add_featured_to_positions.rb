class AddFeaturedToPositions < ActiveRecord::Migration[5.1]
  def change
    add_column :positions, :featured, :boolean, default: false
  end
end

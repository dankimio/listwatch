class AddPostersCacheToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :posters_cache, :string, array: true, default: []
  end
end

class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.integer :movies_count, default: 0

      t.timestamps
    end
  end
end

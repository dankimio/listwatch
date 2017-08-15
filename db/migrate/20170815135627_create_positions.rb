class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.references :list, foreign_key: true
      t.references :movie, foreign_key: true
      t.integer :value

      t.timestamps
    end
    add_index :positions, [:list_id, :movie_id], unique: true
  end
end

class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.integer :tmdb_id
      t.integer :imdb_id
      t.text :description
      t.string :tmdb_poster_path
      t.string :director
      t.date :release_date
      t.float :tmdb_rating
      t.string :trailer_youtube_id

      t.timestamps
    end
    add_index :movies, :tmdb_id, unique: true
    add_index :movies, :imdb_id, unique: true
  end
end

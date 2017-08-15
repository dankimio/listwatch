class Movie < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :positions, dependent: :destroy
  has_many :lists, through: :positions

  def self.find_or_import_from_tmdb(tmdb_id)
    movie = find_by(tmdb_id: tmdb_id)
    return movie if movie

    movie = MovieImporter.new(tmdb_id).import
    movie if movie.save
  end

  def small_poster_url
    image_url(tmdb_poster_path, 185)
  end

  def medium_poster_url
    image_url(tmdb_poster_path, 300)
  end

  private

  def image_url(path, size)
    "https://image.tmdb.org/t/p/w#{size}#{path}"
  end
end

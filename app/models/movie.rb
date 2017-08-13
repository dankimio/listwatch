class Movie < ApplicationRecord
  def small_poster_url
    image_url(tmdb_poster_path, 185)
  end

  def medium_poster_url
    image_url(tmdb_poster_path, 300)
  end

  private

  def image_url(path, size)
    "http://image.tmdb.org/t/p/w#{size}#{path}"
  end
end

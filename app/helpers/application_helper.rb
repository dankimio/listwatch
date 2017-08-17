module ApplicationHelper
  def small_poster_url(tmdb_poster_path)
    poster_url(tmdb_poster_path, 185)
  end

  def medium_poster_url(tmdb_poster_path)
    poster_url(tmdb_poster_path, 300)
  end

  def poster_url(path, size)
    "https://image.tmdb.org/t/p/w#{size}#{path}"
  end
end

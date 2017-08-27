class List < ApplicationRecord
  POSTERS_CACHE_SIZE = 4

  has_many :positions, dependent: :destroy
  has_many :movies,
           -> (list) { order("positions.featured DESC, positions.value #{list.movies_order}") },
           through: :positions

  def progress(user)
    return 0 if movies_count == 0
    rated_movies_count(user).to_f / movies_count.to_f
  end

  def rated_movies_count(user)
    @rated_movies_count ||= (movie_ids & user.movie_ids).count
  end

  def update_posters_cache
    posters = movies.with_poster
      .limit(POSTERS_CACHE_SIZE)
      .pluck(:tmdb_poster_path)

    update_attribute(:posters_cache, posters)
  end

  def movies_order
    descending ? 'DESC' : 'ASC'
  end
end

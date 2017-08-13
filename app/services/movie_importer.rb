class MovieImporter
  attr_reader :movie

  def initialize(tmdb_id)
    @movie = Movie.new(tmdb_id: tmdb_id)
  end

  def import
    parse_credits
    parse_info
    parse_trailer
    @movie
  end

  private

  def parse_credits
    credits = Tmdb::Movie.credits(@movie.tmdb_id)
    @movie.director = parse_director(credits)
  end

  def parse_info
    tmdb_movie = Tmdb::Movie.detail(@movie.tmdb_id)
    @movie.title = tmdb_movie['title']
    @movie.imdb_id = tmdb_movie['imdb_id']
    @movie.description = tmdb_movie['overview']
    @movie.tmdb_poster_path = tmdb_movie['poster_path']
    @movie.tmdb_rating = tmdb_movie['vote_average']
    release_date_string = tmdb_movie['release_date']
    @movie.release_date = Date.parse(release_date_string) if release_date_string
  end

  def parse_trailer
    trailers_info = Tmdb::Movie.trailers(@movie.tmdb_id)
    youtube_trailer = trailers_info['youtube']&.first
    return unless youtube_trailer
    @movie.trailer_youtube_id = youtube_trailer['source']
  end

  def parse_director(credits)
    return unless credits && credits['crew']
    credits['crew'].select { |m| m['job'] == 'Director' }.map { |m| m['name'] }.join(', ')
  end
end

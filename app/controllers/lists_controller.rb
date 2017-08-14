class ListsController < ApplicationController
  def show
    @movies = Movie
      .joins('LEFT JOIN ratings ON ratings.movie_id = movies.id')
      .select('movies.*, ratings.id AS rating_id')
  end
end

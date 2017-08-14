class ListsController < ApplicationController
  def show
    @movies = Movie
      .select('movies.*, EXISTS(SELECT 1 FROM ratings WHERE movie_id = movies.id) AS rating')
  end
end

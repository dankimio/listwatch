class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def show
    @movies = @list.movies
      .select('movies.*, EXISTS(SELECT 1 FROM ratings WHERE movie_id = movies.id) AS rating')
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
end

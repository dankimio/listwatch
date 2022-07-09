class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  def show
    @movies = if user_signed_in?
                @list.movies
                  .select("movies.*, EXISTS(SELECT 1 FROM ratings WHERE movie_id = movies.id AND ratings.user_id = #{current_user.id}) AS rating")
              else
                @list.movies.select('movies.*, FALSE AS rating')
              end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
end

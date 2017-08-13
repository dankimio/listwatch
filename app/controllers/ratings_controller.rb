class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie

  def create
    @rating = current_user.ratings.find_or_create_by(movie: @movie)
  end

  def destroy
    @rating = current_user.ratings.where(movie: @movie).destroy_all
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end

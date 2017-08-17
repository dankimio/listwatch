class RatingsController < ApplicationController
  before_action :set_list
  before_action :set_movie
  before_action :authenticate_user!

  def create
    @rating = current_user.ratings.find_or_create_by(movie: @movie)
  end

  def destroy
    @rating = current_user.ratings.where(movie: @movie).destroy_all
  end

  private

  # Override Devise implementation for remote requests
  def authenticate_user!
    return if user_signed_in?

    session[:user_return_to] = list_url(@list)
    redirect_to new_user_session_path, format: 'js'
  end

  def set_list
    @list = List.find_by(id: params[:list_id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end

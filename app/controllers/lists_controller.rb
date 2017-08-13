class ListsController < ApplicationController
  def show
    @movies = Movie.all
  end
end

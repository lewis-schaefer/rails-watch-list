class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @lists = @movie.lists
  end
end

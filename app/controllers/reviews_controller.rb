class ReviewsController < ApplicationController
  before_action :set_movie, only: [:new, :create]
  before_action :set_review, only: :destroy

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.movie = @movie

    if @review.save
      redirect_to movie_path(@movie)
    end
  end

  def destroy
    @review.destroy
    redirect_to movie_path(params[:id])
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_review
    @review = Review.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:name, :comment, :rating, :movie_id)
  end
end

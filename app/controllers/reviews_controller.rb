class ReviewsController < ApplicationController
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

  private

  def review_params
    params.require(:review).permit(:name, :comment, :rating, :movie_id)
  end
end

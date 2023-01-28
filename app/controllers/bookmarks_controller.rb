class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:new, :create]
  # def index
  #   @bookmarks = Bookmark.find_all(params[:id])
  # end
  def new
    @bookmark = Bookmark.new
  end

  def create

    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list) # or param @bookmark??
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_bookmark
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

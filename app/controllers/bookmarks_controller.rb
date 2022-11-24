class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(safe_params)
    @bookmark.save
    redirect_to list_path(@bookmark.list)
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def safe_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end

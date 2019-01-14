class ArtistsController < ApplicationController
  def index
  # ビューあり
  @artists = Artist.all
  end

  def show
  # ビューあり
  @artist = Artist.find(params[:id])
  end

  def edit
  # ビューあり
  end

  def update
  # ビューなし
  end

  def destroy
  # ビューなし
  end

  def search
  # ビューあり
  end

  def history
  # ビューあり
  end
end

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
  @artist = Artist.find(params[:id])
  end

  def update
  # ビューなし
  @artist = Artist.find(params[:id])
  @artist.update(artist_params)
  redirect_to artist_path(@artist.id)
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

  def artist_params
  params.require(:artist).permit(:email)
  end
end

class ArtistsController < ApplicationController
  def index
  @artists = Artist.all
  end

  def show
  @artist = Artist.find(params[:id])
  end

  def edit
  @artist = Artist.find(params[:id])
  end

  def update
  @artist = Artist.find(params[:id])
  @artist.update(artist_params)
  redirect_to artist_path(@artist.id)
  end

  def destroy
  end

  def search
  end

  def history
  end

  def artist_params
  params.require(:artist).permit(:email)
  end
end

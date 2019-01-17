class ArtistsController < ApplicationController
  def index
    @artists = Artist.order("name").search(params[:search]).page(params[:page]).reverse_order
  end

  def show
    @artist = Artist.find(params[:id])
    @products = @artist.products.reverse_order
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

  private
    def artist_params
      params.require(:artist).permit(:email, :name, :name_kana, :member, :postal_code, :user_address, :phone_number, :profile_image)
    end

    def product_params
      params.require(:product).permit(:name, :price, :label, :genre, :stock, :image, :movie_url)
    end

end

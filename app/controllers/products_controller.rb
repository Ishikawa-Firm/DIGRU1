class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.artist_id = current_artist.id
    if @product.save
        flash.notice = '商品を出品しました．'
        redirect_to products_path
    else
        flash.now.alert = '入力に誤りがあります。'
        render action: 'new'
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.artist_id = current_artist.id
    if @product.update(product_params)
        redirect_to product_path(@product)
    else
        render action: :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    if  product.destroy
        redirect_to products_path
    else
        render action: :new
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :label, :genre, :stock, :image, :movie_url)
    end

end



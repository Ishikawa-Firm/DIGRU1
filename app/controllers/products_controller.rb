class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
        flash.notice = 'メッセージを送信しました。'
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :label, :genre, :stock, :image, :movie_url)
    end

end



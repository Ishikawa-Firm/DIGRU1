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
    @products = Product.where(deleted_at: nil).page(params[:page]).reverse_order
    @artists = Artist.order("name").search(params[:search]).page(params[:page]).reverse_order.where(deleted_at: nil)

    test = CartItem.group(:product_id).sum(:quantity)
    @test = Hash[test.sort_by{ |_, v| -v } ]
    # @test.each_key do |key|
    #   products = Product.find_by(id: key).order(quantity: :desc)
    #   puts products.name
    #   puts products.artist.name
    # end

    # @cart_items = CartItem.group(:product_id)[0].product.name

    # @cart_items = CartItem.group(:product_id).sum(:quantity).sort_by{ | k, v | v }.reverse

    # n_cart_items = Cart.find_by(added_at: nil).cart_items.all
    # n_cart_items.each do |q|
    #   CartItem.group(:product_id).sum(:quantity).find_by(sum_quantity: sum_quantity) -= q.quantity
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    @comment = Comment.new
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
    if  product.update(deleted_at: Time.now)
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



class ProductsController < ApplicationController
  def new
    @product = Product.new
    # 入力欄表示に必要
    @product.disc_numbers.build
    # 子モデルの入力欄が表示されなかったため追記（コントローラ側で作成してあげる必要あり、ちなみに"build"と"New"は同じ）
    @product.disc_numbers[0].musics.build
    # 孫モデルの入力欄を表示するために記述、配列のため先ほどの子モデルを[0]と指定した後に、孫モデルを"build"する
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
    @product_slider = Product.order("name").search(params[:search]).where(deleted_at: nil).page(params[:page]).shuffle
    @products = Product.order("name").search(params[:search]).where(deleted_at: nil).page(params[:page]).reverse_order
    @artists = Artist.order("name").search(params[:search]).page(params[:page]).reverse_order.where(deleted_at: nil)

    ranking = CartItem.group(:product_id).sum(:quantity)
    @ranking = Hash[ranking.sort_by{ |_, v| -v } ]
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
    @artist = current_artist
    @disc_numbers = DiscNumber.all
    @musics = Music.all
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
      params.require(:product).permit(
        :name, :price, :label, :genre, :stock, :image, :movie_url,
          disc_numbers_attributes:[:product_id, :disc_name, :_destroy,
            musics_attributes:[:disc_number_id, :name, :truck_number, :_destroy]
          ]
        )
    end
end



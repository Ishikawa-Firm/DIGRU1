class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #特定のユーザーが登録したお気に入りを全て取得する
    # @favorites = Favorite.where("user_id = ?", @user)
    @test = Favorite.where(user_id: @user.id)
    # puts @favorites
    puts @test
    # @page = Kaminari.paginate_array(@favorites).page(params[:page])
    # puts @page
    @favorites = @test.page(params[:page])

    @products = Product.all
    @carts = Cart.where(user_id: @user)
    @histories = CartItem.where(product_id: @products, cart_id: @carts)
    @histories.each do |h|
      @user = h.cart.user.addresses.find_by(["id = ?", h.cart.address_id])
        end
    end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
  end

  def help
  end

  def confirm_order
    @cart_items = current_user.carts.all.last.cart_items
    @cart = current_user.carts.all.last
    @sum = sum(@cart_items)
  end

  def new_address
    @address = Address.new
  end

  def create_address
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    if @address.save
    redirect_to users_confirm_order_path
    else
      render 'new_address'
    end
  end

  def edit_address
  end

  def update_address
  end

  def destroy_address
  end

  def buy
      # 送付先選択済み
      if !params[:cart][:address_id].nil?
        @cart_items = current_user.carts.all.last.cart_items
        # カートに入っている商品の数量分の在庫数を減らす
        @cart_items.each do |c|
          c.product.stock -= c.quantity
          c.product.update(stock: c.product.stock)
        end
      current_user.carts.all.last.update(buy_params)
      redirect_to users_thanks_path
      # 送付先未選択
      else
        @cart_items = current_user.carts.all.last.cart_items
        @cart = current_user.carts.all.last
        @sum = sum(@cart_items)
        render 'users/confirm_order'
      end
  end

  def session_select
  end

  def registraion_select
  end

  private
  def user_params
    params.require(:user).permit(:name, :hundle_name, :name_kana, :postal_code, :user_address, :phone_number, :profile_image)
  end

  def address_params
    params.require(:address).permit(:other_name, :other_postal_code, :other_address)
  end

  def buy_params
    params.require(:cart).permit(:address_id, :total_price, :added_at)
  end
end

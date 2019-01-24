class AdminsController < ApplicationController
  def edit
  end

  def update
  end

  def show
  end

  def user_history
    @users = User.all
    @products = Product.all
    @carts = Cart.where(user_id: @users).order("created_at")
    @histories = CartItem.where(product_id: @products, cart_id: @carts).order("cart_id DESC")
    @histories.each do |h|
      @user = h.cart.user.addresses.find_by(["id = ?", h.cart.address_id])
    end
  end

  def user_index
    @users = User.order("name").search(params[:search]).page(params[:page]).reverse_order
  end

  def user_search
  end
end

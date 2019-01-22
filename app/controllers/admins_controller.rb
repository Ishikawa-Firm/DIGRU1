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
    @carts = Cart.where(user_id: @users)
    @histories = CartItem.where(product_id: @products, cart_id: @carts)
  end

  def user_index
    @users = User.order("name").search(params[:search]).page(params[:page]).reverse_order
  end

  def user_search
  end
end

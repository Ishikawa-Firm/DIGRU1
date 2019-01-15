class CartItemsController < ApplicationController
  def add_cart_item
  	session[:cart_item] = [] unless session[:cart_item]
    session[:cart_item] << params[:product_id]
    flash[:success] = "商品がカートに追加されました．"
    redirect_to cart_items_path
  end

  def cart_index
  	@cart = session[:cart_item].map { |product_id| CartItem.find(product_id) }
  end

  def update_volume
  end

  def destroy_cart_item
end
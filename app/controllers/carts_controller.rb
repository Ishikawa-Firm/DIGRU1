class CartsController < ApplicationController
	def show
		@cart_items = CartItem.where(cart_id: params[:id])
	end
end

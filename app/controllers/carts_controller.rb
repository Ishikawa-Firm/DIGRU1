class CartsController < ApplicationController
	def show
		@cart_items = CartItem.where(cart_id: params[:id])
		@sum = sum(@cart_items)
	end

	def cart_empty
	end
end

class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :product

	def sub_total
		product.price * quantity
	end
end

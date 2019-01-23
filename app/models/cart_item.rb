class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :product

	enum status:{受付: 0, 商品準備中:1, 出荷済み:2, 商品到着:3}

	def sub_total
		product.price * quantity
	end
end

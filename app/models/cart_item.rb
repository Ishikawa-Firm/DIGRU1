class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :product

	enum status:{受付: 0, 商品準備中:1, 出荷済み:2, 商品到着:3}

	def self.restrict_status_artist
	    statuses.except(:商品到着)
	end

	def self.restrict_status_user
		statuses.except(:受付, :商品準備中)
	end

	def sub_total
		product.price * quantity
	end
end

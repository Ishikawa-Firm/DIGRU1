class Cart < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	belongs_to :user

	enum status:{受付: 0, 商品準備中:1, 出荷済み:2, 商品到着:3}

	def total_price
		cart_items.to_a.sum { |cart_item| cart_item.sub_total }
	end
end

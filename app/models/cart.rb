class Cart < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	belongs_to :user
	belongs_to :address

	def total_price
		cart_items.to_a.sum { |cart_item| cart_item.sub_total }
	end
end

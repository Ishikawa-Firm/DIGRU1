class Product < ApplicationRecord
	has_many :cart_items
	belongs_to :order_detail
	belongs_to :artist
	has_many :disc_numbers

	attachment :image
end

class Product < ApplicationRecord
	has_many :cart_items
	has_many :order_details
	belongs_to :artist
	has_many :disc_numbers

	attachment :image

	# validates :name, presence: true
	# validates :price, presence: true
	# validates :label, presence: true
	# validates :genre, presence: true
	# validates :stock, presence: true
	# validates :movie_url, presence: true

end

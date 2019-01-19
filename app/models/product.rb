class Product < ApplicationRecord
	has_many :cart_items
	has_many :disc_numbers
    has_many :comments, dependent: :destroy

	belongs_to :artist

	attachment :image

	# validates :name, presence: true
	# validates :price, presence: true
	# validates :label, presence: true
	# validates :genre, presence: true
	# validates :stock, presence: true
	# validates :movie_url, presence: true

end

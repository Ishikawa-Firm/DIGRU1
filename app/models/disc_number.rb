class DiscNumber < ApplicationRecord
	belongs_to :product, inverse_of: :disc_numbers
	has_many :musics, inverse_of: :disc_number
	accepts_nested_attributes_for :musics
end

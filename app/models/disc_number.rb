class DiscNumber < ApplicationRecord
	belongs_to :product, inverse_of: :disc_numbers, optional: true
	has_many :musics
	accepts_nested_attributes_for :musics, allow_destroy: true

	validates :disc_name, presence: true, length: { minimum: 2, maximum: 50 }
end

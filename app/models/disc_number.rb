class DiscNumber < ApplicationRecord
	belongs_to :product, inverse_of: :disc_numbers, optional: true
	has_many :musics, dependent: :destroy
	accepts_nested_attributes_for :musics, allow_destroy: true

	validates :disc_name, presence: true, length: { maximum: 50 }
end

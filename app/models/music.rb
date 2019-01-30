class Music < ApplicationRecord
	belongs_to :disc_number, inverse_of: :musics, optional: true

	validates :name, presence: true, length: { minimum: 2, maximum: 50 }
	validates :truck_number, presence: true, numericality: true, length: { minimum: 2, maximum: 50 }
end

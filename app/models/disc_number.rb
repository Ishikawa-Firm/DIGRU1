class DiscNumber < ApplicationRecord
	belongs_to :product
	has_many :musics
end

class Music < ApplicationRecord
	belongs_to :disc_number, inverse_of: :musics, optional: true
end

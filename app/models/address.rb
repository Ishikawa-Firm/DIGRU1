class Address < ApplicationRecord
	belongs_to :user

	validates :other_name, presence: true, length: { minimum: 2, maximum: 30 }
	validates :other_postal_code, presence: true, numericality: true, length: { is: 7 }
	validates :other_address, presence: true, length: { maximum: 100 }
end


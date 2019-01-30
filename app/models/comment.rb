class Comment < ApplicationRecord
	belongs_to :user
    belongs_to :product

    validates :comment_text, presence: true, length: { minimum: 2, maximum: 200 }
end

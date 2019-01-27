class Product < ApplicationRecord
	has_many :cart_items
	has_many :disc_numbers
	accepts_nested_attributes_for :disc_numbers, allow_destroy: true
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :users, through: :favorites

	belongs_to :artist
	belongs_to :user, optional: true

	attachment :image

    def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
    end

	def self.search(search)
    	if search
       		Product.where(['name LIKE ?', "%#{search}%"])
	    else
    	    Product.all
	    end
	  end

	# validates :name, presence: true
	# validates :price, presence: true
	# validates :label, presence: true
	# validates :genre, presence: true
	# validates :stock, presence: true
	# validates :movie_url, presence: true

end

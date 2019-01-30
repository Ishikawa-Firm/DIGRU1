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

	enum genre:{"J-Pop": 0, "Rock/Pops":1, "Animation/Game":2, "World":3}

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

	validates :name, presence: true, length: { minimum: 2, maximum: 50 }
	validates :price, presence: true, numericality: true, length: { maximum: 10 }
	validates :label, presence: true, length: { minimum: 2, maximum: 30 }
	validates :stock, presence: true, length: { maximum: 10000 }
	validates :image_id, presence: true

end

class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :validatable

 	has_many :products

	def active_for_authentication?
		! self.deleted_at?
	end
  # "deleted_at"がtrueの場合はログインできなくなる記述

  attachment :profile_image

  def self.search(search)
    if search
        Artist.where(['name LIKE ?', "%#{search}%"])
    else
        Artist.all
    end
  end

  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :postal_code, presence: true, numericality: true, length: { is: 7 }
  validates :phone_number, presence: true, length: { maximum: 11 }
  validates :user_address, presence: true, length: { maximum: 100 }

end

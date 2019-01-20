class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :addresses
    has_many :orders
    has_many :carts
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    attachment :profile_image

    def self.search(search)
      if search
          User.where(['name LIKE ?', "%#{search}%"])
      else
          User.all
      end
    end
end


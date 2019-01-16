class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :addresses
    has_many :orders

    attachment :profile_image
  def self.search(search)
    if search
        User.where(['email LIKE ?', "%#{search}%"])
    else
        User.all
    end
  end
end


class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :addresses, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :carts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :products, through: :favorites

    attachment :profile_image

  def active_for_authentication?
    ! self.deleted_at?
  end
  # "deleted_at"がtrueの場合はログインできなくなる記述

    def self.search(search)
      if search
          User.where(['name LIKE ?', "%#{search}%"])
      else
          User.all
      end
    end

  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :name_kana, presence: true, length: { minimum: 2, maximum: 30 }
  validates :hundle_name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :postal_code, presence: true, numericality: true, length: { is: 7 }
  validates :phone_number, presence: true, length: { maximum: 11 }
  validates :user_address, presence: true, length: { maximum: 100 }

end

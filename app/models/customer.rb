class Customer < ApplicationRecord
  has_one_attached :image

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  def active_for_authentication?
    super && (is_active == true)
  end

  def full_address
    '〒' + postal_code + ' ' + address
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

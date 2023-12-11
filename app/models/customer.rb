class Customer < ApplicationRecord
  has_one_attached :image

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  def active_for_authentication?
    super && (is_active == true)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

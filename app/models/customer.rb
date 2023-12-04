class Customer < ApplicationRecord
  has_one_attached :image

  def active_for_authentication?
    super && (is_active == true)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

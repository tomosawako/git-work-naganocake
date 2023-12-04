class Public::ItemsController < ApplicationController

  has_one_attached :image
  belongs_to :cart_item
  belongs_to :order_detail
  has_many :genre, dependent: :destroy

end

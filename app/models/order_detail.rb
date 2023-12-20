class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum making_status: { unable_start: 0, waiting_production: 1, making: 2, finish: 3 }

  def subtotal
    item.with_tax_price * amount
  end

end

class Public::OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.save
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end

end


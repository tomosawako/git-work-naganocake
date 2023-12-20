class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @sum = 0
  end

  def update
    order = Order.find(params[:id])
    order.update
    redirect_back(fallback_location: admin_root_path)
  end
end

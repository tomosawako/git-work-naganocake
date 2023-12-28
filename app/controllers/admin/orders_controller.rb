class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @sum = 0
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.status == "confirm_payment"
      @order_details = order.order_details
      @order_details.update(making_status:"waiting_production")
    end
    redirect_back(fallback_location: admin_homes_top_path)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end

class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    order_detail = OrderDetail.find(params[:id])
    @order = Order.find_by(id: order_detail.order_id)
    order_detail.update(order_detail_params)
    if @order.order_details.all?{|detail|detail.making_status=="finish"}
      @order.update(status:"preparing_ship")
    end
    redirect_back(fallback_location: admin_homes_top_path)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end

class Public::CartItemsController < ApplicationController
  def index
  end

  def create
    #binding.pry
    @item = Item.find(cart_item_params[:item_id])
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end

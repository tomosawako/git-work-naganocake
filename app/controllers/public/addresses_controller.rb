class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.save
  end

  private

  def address_params
    params.require(:item).permit(:customer_id, :name, :postal_code, :address)
  end


end

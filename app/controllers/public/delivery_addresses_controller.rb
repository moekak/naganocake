class Public::DeliveryAddressesController < ApplicationController
  def index
    @delivery_addresses = current_customer.addresses
    @delivery_address = Address.new
  end

  def create
    @delivery_address = Address.new(address_params)
    @delivery_address.customer_id = current_customer.id
    @delivery_address.save
    redirect_to delivery_addresses_path
  end

  def edit
    @delivery_address = Address.find(params[:id])
  end

  def update
    delivery_address = Address.find(params[:id])
    delivery_address.update(address_params)
    redirect_to delivery_addresses_path
  end
  def destroy
    @delivery_address = Address.find(params[:id])
    @delivery_address.destroy
    redirect_to delivery_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end
end
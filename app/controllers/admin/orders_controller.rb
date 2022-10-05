class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order.shipping_cost = 800
    @bill = 0


  end

  def index
   @orders = Order.all
  end



  def update
    status = Order.find(params[:id])
    status.update(order_params)
    redirect_to admin_order_path

  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :customer_id)
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
end

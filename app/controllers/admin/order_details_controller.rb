class Admin::OrderDetailsController < ApplicationController
  def update
    making_status = OrderDetail.find(params[:id])
    making_status.update(order_detail_params)
    redirect_to admin_order_path(making_status.order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
end

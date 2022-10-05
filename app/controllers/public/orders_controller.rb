class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    render :confirm
  end

  def index
   @orders = current_customer.orders
   @cart_items = current_customer.cart_items

  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if params[:address_number] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:address_number] == "2"
      @address = Address.find(params[:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      render :confirm
    end
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800
    @total = 0
    @bill = 0

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id =  @order.id
        @order_detail.price =  cart_item.item.price
        @order_detail.item_id =  cart_item.item.id
        @order_detail.amount =  cart_item.amount
        @order_detail.save
      end
      redirect_to orders_thank_path

      current_customer.cart_items.destroy_all
    end
  end

  def show
    @order = Order.find(params[:id])
    @order.shipping_cost = 800
    @bill = 0

  end




  def thank
  end







  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :customer_id)
  end
end

class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
  end
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end



  private
  def cart_item_params
     params.require(:cart_item).permit(:amount, :customer_id, :item_id)
  end


end

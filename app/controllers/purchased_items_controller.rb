class PurchasedItemsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchased_item = PurchasedItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchased_item = PurchasedItem.new(purchased_item_params)
    if @purchased_item.valid?
      pay_item
      @purchased_item.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def purchased_item_params
    params.permit(:item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchased_item_params[:token],
        currency: 'jpy'
      )
  end
end

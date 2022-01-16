class PurchasedItemsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchased_item = PurchasedItem.new
  end

  def create
    PurchasedItem.create(purchased_item_params)
  end

  private
  def purchased_item_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end
end

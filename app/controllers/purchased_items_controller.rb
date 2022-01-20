class PurchasedItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.user.id != current_user.id && @item.purchased_item.blank?
      @item_address = ItemAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @item_address = ItemAddress.new(item_address_params)
    if @item_address.valid?
      pay_item
      @item_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_address_params
    params.require(:item_address).permit(:post_code, :prefecture_id, :municipality, :house_number, :building, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: item_address_params[:token],
      currency: 'jpy'
    )
  end
end

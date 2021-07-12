class BuyersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buyer_delivery_info = BuyerDeliveryInfo.new
    if current_user == @item.user
      redirect_to root_path
    elsif @item.buyer.present?
      redirect_to root_path
    end
  end

  def new
    @buyer_delivery_info = BuyerDeliveryInfo.new
  end

  def create
    @buyer_delivery_info = BuyerDeliveryInfo.new(buyer_params)
    @item = Item.find(params[:item_id])
    if @buyer_delivery_info.valid?
      pay_item
      @buyer_delivery_info.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_delivery_info).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name,
                                                :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end

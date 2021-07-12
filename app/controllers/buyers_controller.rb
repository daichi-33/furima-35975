class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buyer, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @buyer_delivery_info = BuyerDeliveryInfo.new
  end

  def create
    @buyer_delivery_info = BuyerDeliveryInfo.new(buyer_params)
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

  def set_buyer
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user
      redirect_to root_path
    elsif @item.buyer.present?
      redirect_to root_path
    end
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

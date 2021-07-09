class BuyersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @buyer_delivery_info = BuyerDeliveryInfo.new
  end
  
  def new
    @buyer_delivery_info = BuyerDeliveryInfo.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_delivery_info = BuyerDeliveryInfo.new(buyer_params)
    if @buyer_delivery_info.valid?
      @buyer_delivery_info.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_delivery_info).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

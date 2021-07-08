class BuyersController < ApplicationController
  def index
  end
  
  def new
  end

  def create
    @buyer_record = BuyerRecord.create(buyer_record_params)
    DeliveryInfo.create(delivery_info_params)
    redirect_to root_path
  end

  private

  def buyer_record_params
    params.permit(:buyer_record),merge(user_id: current_user.id)
  end

  def delivery_info_params
    params.permit(:postal_code, :prefecture, :municipality, :address, :building_name, :phone_number).merge(buyer_record_id: @buyer_record.id)
end

class BuyerDeliveryInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :municipality
    validates :address
    validates :phone_number,  numericality: {with: /\A0[0-9]{9,10}\z/}
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: {other_than: 1}

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    DeliveryInfo.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                        building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end

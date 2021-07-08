class DeliveryInfo < ApplicationRecord
  belongs_to :buyer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :postal_code,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :municipality
    validates :address
    validates :phone_number,  numericality: {only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 11}
  end

end
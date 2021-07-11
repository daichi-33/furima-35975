class Buyer < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :delivery_info

  attr_accessor :token
end
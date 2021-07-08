class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :delivery_area
  belongs_to :delivery_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price,       format: { with: /\A[0-9]+\z/ },
                            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :delivery_area_id
    validates :delivery_day_id
  end
end

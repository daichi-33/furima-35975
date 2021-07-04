class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :delivery_area
  belongs_to :delivery_day

  with_options presence: true do
    validates :image
    validates :name,        length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price,       format: { with: /\A[0-9]+\z/ }
  end

  with_options presence: true, numericality: { other_than:1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :delivery_area_id
    validates :delivery_day_id
  end
end
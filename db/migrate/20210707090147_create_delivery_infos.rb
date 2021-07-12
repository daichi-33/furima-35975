class CreateDeliveryInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_infos do |t|
      t.references :buyer,                null: false, foreign_key: true
      t.string     :postal_code,          null: false
      t.integer    :prefecture_id,        null: false
      t.string     :municipality,         null: false
      t.string     :address,              null: false
      t.string     :building_name
      t.string     :phone_number,         null: false, unique: true 

      t.timestamps
    end
  end
end
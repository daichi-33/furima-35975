require 'rails_helper'

RSpec.describe BuyerDeliveryInfo, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buyer_delivery_info = FactoryBot.build(:buyer_delivery_info, user_id: @user.id, item_id: @item.id)
    sleep 0.5
  end

  context '内容に問題がない場合' do
    it 'すべての項目が正しく入力されている場合、保存できる' do
      expect(@buyer_delivery_info).to be_valid
    end

    it 'building_nameが空の場合でも保存できる' do
      @buyer_delivery_info.building_name = ''
      expect(@buyer_delivery_info).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空の場合、保存できない' do
      @buyer_delivery_info.token = ''
      @buyer_delivery_info.valid?
      expect(@buyer_delivery_info.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空の場合、保存できない' do
      @buyer_delivery_info.postal_code = ''
      @buyer_delivery_info.valid?
      expect(@buyer_delivery_info.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でない場合、保存できない' do
      @buyer_delivery_info.postal_code = 2_345_678
      @buyer_delivery_info.valid?
      expect(@buyer_delivery_info.errors.full_messages).to include('Postal code is invalid')
    end

    it 'prefecture_idを選択していない場合、保存できない' do
      @buyer_delivery_info.prefecture_id = 1
      @buyer_delivery_info.valid?
      expect(@buyer_delivery_info.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'municipalityが空の場合、保存できない' do
      @buyer_delivery_info.municipality = ''
      @buyer_delivery_info.valid?
      expect(@buyer_delivery_info.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'addressが空の場合、保存できない' do
      @buyer_delivery_info.address = ''
      @buyer_delivery_info.valid?
      expect(@buyer_delivery_info.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空の場合、保存できない' do
      @buyer_delivery_info.phone_number = ''
      @buyer_delivery_info.valid?
      expect(@buyer_delivery_info.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが全角数字の場合、保存できない' do
      @buyer_delivery_info.phone_number = '０９０４５３６７２８１'
      @buyer_delivery_info.valid?
      expect(@buyer_delivery_info.errors.full_messages).to include('Phone number is not a number')
    end

    it 'phone_numberが半角のハイフンを含んでいる場合、保存できない' do
      @buyer_delivery_info.phone_number = '090-3829-1837'
      @buyer_delivery_info.valid?
      expect(@buyer_delivery_info.errors.full_messages).to include('Phone number is not a number')
    end

    it 'userと紐付いていない場合、保存できない' do
      @buyer_delivery_info.user_id = nil
      @buyer_delivery_info.valid?
      expect(@buyer_delivery_info.errors.full_messages).to include("User can't be blank")
    end

    it 'itemと紐付いていない場合、保存できない' do
      @buyer_delivery_info.item_id = nil
      @buyer_delivery_info.valid?
      expect(@buyer_delivery_info.errors.full_messages).to include("Item can't be blank")
    end
  end
end

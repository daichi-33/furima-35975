FactoryBot.define do
  factory :item do
    user_id           { '1' }
    name              { 'item' }
    description       { '説明' }
    category_id       { '2' }
    condition_id      { '2' }
    postage_id        { '2' }
    delivery_area_id  { '2' }
    delivery_day_id   { '2' }
    price             { '1000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

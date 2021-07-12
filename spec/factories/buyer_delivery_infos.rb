FactoryBot.define do
  factory :buyer_delivery_info do
    token           { 'tok_abcdefghijk00000000000000000' }
    postal_code     { '456-1827' }
    prefecture_id   { 2 }
    municipality    { '札幌市' }
    address         { '函館' }
    building_name   { '3 - 7' }
    phone_number    { '09065747383' }
  end
end

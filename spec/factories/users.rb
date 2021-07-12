FactoryBot.define do
  factory :user do
    nickname                 { 'test' }
    email                    { Faker::Internet.email }
    password                 { 'asd123' }
    password_confirmation    { 'asd123' }
    last_name                { '山田' }
    first_name               { '太郎' }
    last_name_kana           { 'ヤマダ' }
    first_name_kana          { 'タロウ' }
    birthday                 { '2000-01-01' }
  end
end

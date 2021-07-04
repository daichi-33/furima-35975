class Category < ActiveHash::Base
  self.data = [
    { id: 1, date: '--' },
    { id: 2, date: 'メンズ' },
    { id: 3, date: 'レディース' },
    { id: 4, date: 'ベビー・キッズ' },
    { id: 5, date: 'インテリア・住まい・小物' },
    { id: 6, date: '本・音楽・ゲーム' },
    { id: 7, date: 'おもちゃ・ホビー・グッズ' },
    { id: 8, date: '家電・スマホ・カメラ' },
    { id: 9, date: 'スポーツ・レジャー' },
    { id: 10, date: 'ハンドメイド' },
    { id: 11, date: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end

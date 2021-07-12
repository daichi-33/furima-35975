class Condition < ActiveHash::Base
  self.data = [
    { id: 1, date: '--' },
    { id: 2, date: '新品・未使用' },
    { id: 3, date: '未使用に近い' },
    { id: 4, date: '目立った傷や汚れなし' },
    { id: 5, date: 'やや傷や汚れあり' },
    { id: 6, date: '傷や汚れあり' },
    { id: 7, date: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end

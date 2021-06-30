# テーブル設計


## users テーブル

| Column                  | Type       | Options                    |
| ----------------------- | ---------- | -------------------------- |
| nickname                | string     | null: false                |
| email                   | string     | null: false, unique: true  |
| encrypted_password      | string     | null: false                |
| last_name               | string     | null: false                |
| first_name              | string     | null: false                |
| last_name_kana          | string     | null: false                |
| first_name_kana         | string     | null: false                |
| birthday                | date       | null: false                |

### Association

 has_many :items
 has_many :buyer_records
 
## items テーブル

| Column                 | Type        | Options                         |
| ---------------------- | ----------- | ------------------------------- |
| user                   | references  | null: false, foreign_key: true  |
| item_name              | string      | null: false                     |
| description            | text        | null: false                     |
| category_id            | integer     | null: false                     |
| condition_id           | integer     | null: false                     |
| postage_id             | integer     | null: false                     |
| delivery_area_id       | integer     | null: false                     |
| delivery_days_id       | integer     | null: false                     |
| price                  | integer     | null: false                     |

### Association

belongs_to :user
has_one :buyer_record


## buyer_records テーブル

| Column                 | Type        | Options                         |
| ---------------------- | ----------- | ------------------------------- |
| user                   | references  | null: false, foreign_key: true  |
| item                   | references  | null: false, foreign_key: true  |

### Association

belongs_to :user
belongs_to :item
has_one :delivery_info

## delivery_infos テーブル

| Column                 | Type        | Options                         |
| ---------------------- | ----------- | ------------------------------- |
| user                   | references  | null: false, foreign_key: true  |
| postal_code            | string      | null: false                     |
| prefectures_id         | integer     | null: false                     |
| municipality           | string      | null: false                     |
| address                | string      | null: false                     |
| building_name          | string      |                                 | 
| phone_number           | string      | null: false, unique: true       |

### Association

 belongs_to :buyer_record
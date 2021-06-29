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
 has_many :buyers_record
 
## items テーブル

| Column                 | Type        | Options                         |
| ---------------------- | ----------- | ------------------------------- |
| user                   | references  | null: false, foreign_key: true  |
| image                  |             | null: false                     |
| item_name              | string      | null: false                     |
| description            | text        | null: false                     |
| category               | integer     | null: false                     |
| condition              | integer     | null: false                     |
| postage                | integer     | null: false                     |
| delivery_area          | integer     | null: false                     |
| delivery_days          | integer     | null: false                     |
| price                  | integer     | null: false                     |

### Association

belongs_to :users
has_one :buyers_record


## buyers_record テーブル

| Column                 | Type        | Options                         |
| ---------------------- | ----------- | ------------------------------- |
| user                   | references  | null: false, foreign_key: true  |
| item                   | references  | null: false, foreign_key: true  |

### Association

belongs_to :users
belongs_to :items
has_one :deliveries_info

## deliveries_info テーブル

| Column                 | Type        | Options                         |
| ---------------------- | ----------- | ------------------------------- |
| user                   | references  | null: false, foreign_key: true  |
| postal_code            | string      | null: false                     |
| prefectures            | integer     | null: false                     |
| municipality           | string      | null: false                     |
| address                | string      | null: false                     |
| building_name          | string      |                                 | 
| phone_number           | string      | null: false, unique: true       |

### Association

 belongs_to :buyers_record
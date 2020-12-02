# テーブル設計


## users テーブル
| column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | date   | null: false |


### Association

- has_many :items
- has_many :orders




## items テーブル
| column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| name                  | string     | null: false                   |
| info                  | text       | null: false                   |
| price                 | integer    | null: false                   |
| category_id           | integer    | null: false                   |
| status_id             | integer    | null: false                   |
| shipping_fee_id       | integer    | null: false                   |
| shipping_area_id      | integer    | null: false                   |
| scheduled_delivery_id | integer    | null: false                   |
| user                  | references | null:false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order




## orders テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address




## addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| number        | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |


### Association
- belongs_to :order
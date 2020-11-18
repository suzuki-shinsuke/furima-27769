# テーブル設計


## users テーブル
| column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | date   | null: false |


### Association

- has_many :items
- has_many :buys




## items テーブル
| column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| image              |            |                               |
| name               | string     | null: false                   |
| info               | text       | null: false                   |
| price              | integer    | null: false                   |
| category           | string     | null: false                   |
| status             | string     | null: false                   |
| shipping_fee       | string     | null: false                   |
| shipping_area      | string     | null: false                   |
| scheduled_delivery | string     | null: false                   |
| user_id            | references | null:false, foreign_key: true |


### Association

- belongs_to :user
- has_one :buy




## buys テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :item
- has_one :address




## addresses テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | integer    | null: false                    |
| prefecture  | text       | null: false                    |
| city        | text       | null: false                    |
| address     | text       | null: false                    |
| building    | text       |                                |
| number      | integer    | null: false                    |
| buy_id      | references | null: false, foreign_key: true |


### Association
- has_one: buy
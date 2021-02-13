# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| encrypted_password   | string | null: false |
| first_name   | string | null: false |
| last_name   | string | null: false |
| first_name_reading   | string | null: false |
| last_name_reading   | string | null: false |
| birth_date   | date | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| price   | integer | null: false |
| item_description   | text | null: false |
| user   | references | null: false, foreign_key: true |
| category_id | integer | null: false |
| status_id   | integer | null: false |
| fee_id   | integer | null: false |
| area_id   | integer | null: false |
| days_to_ship_id   | integer | null: false |

### Association

- belongs_to :user
- has_one :order

## order テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_code | string     |    null: false                  |
| area_id   | integer | null: false |
| city | string     |    null: false                  |
| address | string     |    null: false          |
| house_number | string     |  ------------------------------  |
| phone_number | string     |    null: false                  |
| order   | references | null: false, foreign_key: true |

### Association

- belongs_to :order
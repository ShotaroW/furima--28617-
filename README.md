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

- has_many :item_users
- has_many :items, through: item_users
- has_many :record

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| price   | integer | null: false |
| text   | text | null: false |
| user   | references | null: false, foreign_key: true |
| category_id | integer | null: false |
| status_id   | integer | null: false |
| fee_id   | integer | null: false |
| area_id   | integer | null: false |
| days to ship_id   | integer | null: false |

### Association

- belongs_to :user
- has_one :record

## record テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| area_id   | references | null: false, foreign_key: true |
| City | string     |    null: false                  |
| street_number | string     |    null: false          |
| village_number | string     |  ------------------------------  |
| post_number | string     |    null: false                  |
| telephone_number | string     |    null: false                  |
| record   | references | null: false, foreign_key: true |

### Association

- belongs_to :record
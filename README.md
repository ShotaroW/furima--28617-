# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| encrypted_password   | string | null: false |
| FIRST_NAME   | string | null: false |
| LAST_NAME   | string | null: false |
| first_name   | string | null: false |
| last_name   | string | null: false |
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
| category | integer | null: false |
| status   | integer | null: false |
| fee   | integer | null: false |
| area   | integer | null: false |
| days to ship   | integer | null: false |

### Association

- has_many :room_users
- has_many :users, through: item_users
- has_many :record

## item_users テーブル
| items   | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user

## record テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :address

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| State | integer     |    null: false                  |
| City | integer     |    null: false                  |
| street_number | string     |    null: false          |
| village_number | string     |    null: false                  |
| post_number | string     |    null: false                  |
| telephone_number | string     |    null: false                  |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :record
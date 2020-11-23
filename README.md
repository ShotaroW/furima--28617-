# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| user   | references | null: false, foreign_key: true |

## record テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | string     |                                |
| user    | references | null: false, foreign_key: true |
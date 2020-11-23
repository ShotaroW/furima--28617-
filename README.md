# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password   | string | null: false |
| NAME   | string | null: false |
| name   | string | null: false |
| Date   | string | null: false |

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| images  | string | null: false |
| price   | string | null: false |
| text   | string | null: false |
| user   | references | null: false, foreign_key: true |
| category | string | null: false |
| status   | string | null: false |
| fee   | string | null: false |
| area   | string | null: false |
| days to ship   | string | null: false |

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
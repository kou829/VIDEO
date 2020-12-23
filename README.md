# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :videos
- has_many :comments

## videos テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| title     | string     | null: false                    |
| overview  | string     | null: false                    |
| video     |            | null: false                    | active_storageの実装
| genre     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     | null: false                    |
| heart   | integer    | null: false                    |
| user    | references | null: false, foreign_key: true |
| video   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :video
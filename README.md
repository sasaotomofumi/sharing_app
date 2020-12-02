# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| occupation | string | null: false |
| position   | string | null: false |

## Association

-has_many :rooms
-has_many :room_users
-has_many :messages
-has_many :suggestion
-has_many :share_messages

## rooms テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| name      | string | null: false |
| purpose   | string | null: false |

## Association

-has_many :users
-has_many :room_users
-has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

## Association

-belongs_to :user
-belongs_to :room

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

## Association

-belongs_to :room


## suggestion テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| purpose | string     | null: false                    |
| detail  | text       | null: false                    |         
| deadline| string     | null: false                    |
| user    | references | null: false, foreign_key: true |

## Association

-belongs_to :user
-has_many :share_messages


## share_messages テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| content       | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| suggestion    | references | null: false, foreign_key: true |

## Association

-belongs_to :suggestion
-belongs_to :user
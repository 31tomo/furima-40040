# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| price              | integer    | null: false                    |
| message            | text       | null: false                    |
| seller             | string     | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| shipping_cost      | string     | null: false                    |
| shipping_region    | string     | null: false                    |
| shipping_date      | string     | null: false                    |
| comment            | text       | null: false                    |
| saler_id           | references | null: false, foreign_key: true |
| buyer_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_number        | integer    | null: false                    |
| exp_month_year     | integer    | null: false                    |
| approval_code      | integer    | null: false                    |
| postal_code        | integer    | null: false                    |
| item_id            | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| region             | string     | null: false                    |
| city               | string     | null: false                    |
| house_number       | integer    | null: false                    |
| building_name      | string     |                                |
| phone              | integer    | null: false                    |
| order_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :order

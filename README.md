# テーブル設計

## Users

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |text  |null: false, unique: true|
|email             |string|null: false              |
|encrypted_password|string|null: false              |
|family_name       |string|null: false              |
|first_name        |string|null: false              |
|family_name_kana  |string|null: false              |
|first_name_kana   |string|null: false              |
|birthday          |date  |null: false              |

### Association
- has_many :items
- has_many :purchased_items

## Items

|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|name       |string    |null: false                   |
|description|text      |null: false                   |
|price      |integer   |null: false                   |
|user_id    |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :purchased_item

## Purchased_items

|Column |Type      |Options                       |
|-------|----------|------------------------------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## Shipping_addresses

|Column      |Type  |Options    |
|------------|------|-----------|
|post_code   |string|null: false|
|municipality|string|null: false|
|house_number|string|null: false|
|building    |string|           |
|tel         |string|null: false|

### Association
- belongs_to :purchased_item





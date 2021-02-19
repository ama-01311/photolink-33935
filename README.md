# テーブル設計

## usersテーブル

| Column                     | Type    | Options                   |
| -------------------------- | ------- | ------------------------- |
| nickname                   | string  | null: false               |
| email                      | string  | null: false, unique: true |
| encrypted_password         | string  | null: false               |
| lname                      | string  | null: false               |
| fname                      | string  | null: false               |
| lname_kana                 | string  | null: false               |
| fname_kana                 | string  | null: false               |
| birth_date                 | date    | null: false               |


### Association

- has_many :photos
- has_many :orders

## photosテーブル

| Column                    | Type        | Options           |
| ------------------------- | ----------- | ----------------- |
| photo_title               | string      | null: false       |
| photo_description         | text        | null: false       |
| photo_category_id         | integer     | null: false       |
| photo_place_id            | integer     | null: false       |
| selling_price             | integer     | null: false       |
| user                      | references  | foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## ordersテーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| user                  | references | foreign_key: true |
| photo                 | references | foreign_key: true |

### Association

- belongs_to :photo
- belongs_to :user
- has_one :address
- has_one :option

## addressesテーブル

| Column                   | Type        | Options           |
| ------------------------ | ----------- | ----------------- |
| post_number              | string      | null: false       |
| prefecture_id            | integer     | null: false       |
| municipality             | string      | null: false       |
| address                  | string      | null: false       |
| building                 | string      |                   |
| phone_number             | string      | null: false       |
| order                    | references  | foreign_key :true |

### Association
- belongs_to :order

## optionsテーブル

| Column                   | Type        | Options           |
| ------------------------ | ----------- | ----------------- |
| theme_id                 | integer     | null: false       |
| flame_id                 | integer     | null: false       |
| type_id                  | integer     | null: false       |
| order                    | references  | foreign_key :true |

### Association
- belongs_to :order
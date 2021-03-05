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

## optionsテーブル

| Column                   | Type        | Options           |
| ------------------------ | ----------- | ----------------- |
| post_number              | string      | null: false       |
| prefecture_id            | integer     | null: false       |
| municipality             | string      | null: false       |
| address                  | string      | null: false       |
| building                 | string      |                   |
| phone_number             | string      | null: false       |
| theme_id                 | integer     | null: false       |
| flame_id                 | integer     | null: false       |
| type_id                  | integer     | null: false       |
| order_option             | references  | foreign_key :true |

### Association
- belongs_to :order_option

## order_optionsテーブル

| Column                   | Type        | Options           |
| ------------------------ | ----------- | ----------------- |
| user                     | references  | foreign_key: true |
| photo                    | references  | foreign_key: true |

### Association
- belongs_to :photo
- belongs_to :user
- has_one :option

# PHOTOLINK

## 主な機能
- 誰でも登録できて、誰でも簡単におしゃれな写真を出品・購入できる

## URL
- https://photolink-33935.herokuapp.com/

## 利用方法
- ユーザー登録を行う
- 出品したい写真があれば、出品をする
- 購入したい写真があれば、購入する

## 目指した課題解決
- おしゃれな写真を素材や写真として所持したい人と、趣味の写真を出品したい人をつなげる

## 洗い出した要件
- ユーザー管理機能
- 写真出品・購入機能
- 写真一覧表示・編集・削除機能

## 実装予定の機能
- マイページ機能
- オプションの視覚化

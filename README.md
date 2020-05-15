# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null;false|

### Association
- has_many :notes


## note テーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index|
|content|string|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
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

# chatspaceデータベース

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index:true, null:false, unique:true|
|email|string|null:false, unique:true|
|password|text|null:false, unique:true|

### Association
- has_many :messages
- has_many :groups, through: :groups_users
- has_many :groups_users
<br>

##groupsテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|index:true, null:false, unique:true|

### Association
- has_many :messages
- has_many :users, through: :groups_users
- has_mant :groups_users
<br>

## groups_usersテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|group_id|references|null:false, foreign_key:true|

### Association
- belongs_to :group
- belongs_to :user
<br>

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|string||
|group_id|references|null:false, foreign_key:true|
|user_id|references|null:false, foreign_key:true|

### Association
- belongs_to :group
- belongs_to :user
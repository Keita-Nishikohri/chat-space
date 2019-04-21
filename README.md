# chatspaceデータベース

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index:true, null:false, unique:true|
|email|string|null:false, unique:true|
|password|string|null:false|

### Association
- has_many :messages
- has_many :groups, through: :group_users
- has_many :group_users

##groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false, unique:true|

### Association
- has_many :messages
- has_many :users, through: :group_users
- has_many :group_users

## group_usersテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|group_id|references|null:false, foreign_key:true|

### Association
- belongs_to :group
- belongs_to :user

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
require 'sequel'

DB = Sequel.sqlite
DB.create_table :users do
  primary_key :id
  String :name
  String :email_address, unique: true
  String :telephone_number
  String :website
  Datetime :created_at
end

class UserDatabase
  attr_reader :collection

  def initialize(collection)
    @collection = collection
  end

  def save_users
    users_table = DB[:users]
    collection.each do |user|
      users_table.insert user.to_h.merge(created_at: Date.today)
    end
  end

  def users
    DB["select * from users"]
  end
end

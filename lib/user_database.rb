require 'sequel'

class UserDatabase
  DB = Sequel.sqlite
  attr_reader :collection

  def initialize(collection)
    DB.create_table :users do
      primary_key :id
      String :name
      String :email_address
      String :telephone_number
      String :website
      Datetime :created_at
    end

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

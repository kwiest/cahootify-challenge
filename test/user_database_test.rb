require 'test_helper'
require 'user_database'
require 'database_cleaner'

class UserDatabaseTest < Minitest::Test
  def setup
    DatabaseCleaner.strategy = :transaction

    @users = [
      User.new(
        name: "Kyle Wiest", email_address: "kyle.wiest@gmail.com",
        telephone_number: "+1 123-456-7890", website: "https://ecommerceonrails.com"
      )
    ]
    @user_database = UserDatabase.new @users
  end

  def test_saving_users
    assert @user_database.save_users
    assert_equal "Kyle Wiest", @user_database.users.first[:name]
  end

  def test_emails_must_be_unique
    new_users = [User.new(name: "Kyle #2", email_address: "kyle.wiest@gmail.com")]
    database = UserDatabase.new new_users

    assert_raises Sequel::UniqueConstraintViolation do
      database.save_users
    end
  end
end

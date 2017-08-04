require 'test_helper'
require 'user_database'

class UserDatabaseTest < Minitest::Test
  def setup
    users = [
      User.new(
        name: "Kyle Wiest", email_address: "kyle.wiest@gmail.com",
        telephone_number: "+1 123-456-7890", website: "https://ecommerceonrails.com"
      )
    ]
    @user_database = UserDatabase.new users
  end

  def test_saving_users
    assert @user_database.save_users
    assert_equal "Kyle Wiest", @user_database.users.first[:name]
  end
end

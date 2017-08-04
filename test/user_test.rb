require 'test_helper'
require 'user'

class UserTest < Minitest::Test
  def setup
    @attributes = {
      name: "Kyle Wiest",
      email_address: "kyle.wiest@gmail.com",
      telephone_number: "+1 123-456-7890",
      website: "https://ecommerceonrails.com"
    }
  end

  def test_creation
    user = User.new  @attributes
    assert_instance_of User, user
    assert_equal "Kyle Wiest", user.name
  end

  def test_name_required
    @attributes.delete :name

    assert_raises ArgumentError do
      user = User.new @attributes
    end
  end

  def test_email_address_required
    @attributes.delete :email_address

    assert_raises ArgumentError do
      user = User.new @attributes
    end
  end
end

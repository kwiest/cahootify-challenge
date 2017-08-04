class User
  attr_accessor :name, :email, :telephone_number, :website

  def initialize(name:, email:, telephone_number: "", website: "")
    @name = name
    @email = email
    @telephone_number = telephone_number
    @website = website
  end
end

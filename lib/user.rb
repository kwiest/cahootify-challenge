class User
  attr_accessor :name, :email_address, :telephone_number, :website

  def initialize(name:, email_address:, telephone_number: "", website: "")
    raise ArgumentError.new("Name is required") if name.nil?
    raise ArgumentError.new("Email address is required") if email_address.nil?

    @name = name
    @email_address = email_address
    @telephone_number = telephone_number
    @website = website
  end

  def to_h
    {
      name: name,
      email_address: email_address,
      telephone_number: telephone_number,
      website: website
    }
  end
end

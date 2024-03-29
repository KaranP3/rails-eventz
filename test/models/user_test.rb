require "test_helper"

# test "the truth" do
#   assert true
# end
class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email:"user@example.com")
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@email.foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email validation should accept valid email addresses" do
    valid_addresses = %w[user@example.com user@example.com.br user.last@foo.au]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
end

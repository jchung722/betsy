require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
test "merchants with minimal information must be valid" do
    assert merchants(:merchant1).valid?
  end

  test "merchants without minimal information must be invalid" do
    assert_equal false, merchants(:merchant3).valid?
  end

  test "merchants should return their associated attributes" do
    assert_equal "bob1", merchants(:bob).username
    assert_equal "github", merchants(:bob).provider
    assert_equal "bob@bobness.com", merchants(:bob).email
  end

  test "merchants without a unique email are invalid" do
    merchant = Merchant.new(username:"merchant50", email: "bob@bobness.com")
    assert_equal "merchant50", merchant.username
    assert_equal false, merchant.valid?
  end

end

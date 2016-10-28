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

  test "Orders method should return a filtered array of orders belonging to merchant given allowable array of orders" do
    #:testorder1 and :goodorder are related to :bob merchant; method should only allow :goodorder to be listed in array.
    assert merchants(:bob).orders([orders(:goodorder)]), [orders(:goodorder)]
    assert_not merchants(:bob).orders([orders(:goodorder)]).include?(orders(:testorder1))
  end

  test "order_by_status method should return a filtered array of orders belonging to merchant given a status to filter for" do
    #:testorder1, :testorder2, and :pendingorder are related to :jane merchant; method should only allow :pendingorder to be listed in array.
    assert merchants(:jane).order_by_status("pending"), [orders(:pendingorder)]
    assert_not merchants(:jane).order_by_status("pending").include?(orders(:testorder1))
  end

end

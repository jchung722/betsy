require 'test_helper'

class OrderitemTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "Orderitem must have quantity and belong to a product and order to be valid" do
    assert orderitems(:gooditem).valid?
  end

  test "Orderitem that does not belong to a product is invalid" do
    assert_not orderitems(:noproductlink).valid?
    orderitems(:noproductlink).product_id = 2
    assert orderitems(:noproductlink).valid?
  end

  test "Orderitem that does not belong to an order is invalid" do
    assert_not orderitems(:noorderlink).valid?
    orderitems(:noorderlink).order_id = 1
    assert orderitems(:noorderlink).valid?
  end

  test "Orderitem without quantity value is invalid" do
    assert_not orderitems(:noquantity).valid?
    orderitems(:noquantity).quantity = 50
    assert orderitems(:noquantity).valid?
  end

  test "Quantity must be an integer and greater than 0 to be valid" do
    assert_not orderitems(:quantityissue).valid?
    orderitems(:quantityissue).quantity = 0
    assert_not orderitems(:quantityissue).valid?
    orderitems(:quantityissue).quantity = 50
    assert orderitems(:quantityissue).valid?
  end

end

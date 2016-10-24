require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "Product with minimal and all normal information must be valid" do
    assert products(:minimalproduct).valid?
    assert products(:goods).valid?
  end

  test "Products without a name are invalid" do
    assert_not products(:nonameproduct).valid?
    products(:nonameproduct).name = "A Product"
    assert products(:nonameproduct).valid?
  end

  test "Products without a unique name are invalid" do
    product = Product.new(name:"Imnotunique", price: 1, merchant_id: 1)
    assert_equal product.name, products(:copyproduct).name
    assert_not product.valid?
    product.name = "Unique Product"
    assert product.valid?
  end

  test "Products without a price are invalid" do
    assert_not products(:noprice).valid?
    products(:noprice).price = 1
    assert products(:noprice).valid?
  end

  test "Product prices must be greater than 0" do
    assert_not products(:nonumprice).valid?
    products(:nonumprice).price = 0
    assert_not products(:nonumprice).valid?
    products(:nonumprice).price = 0.5
    assert products(:nonumprice).valid?
  end

  test "Products must belong to a merchant" do
    assert_not products(:nomerchant).valid?
    products(:nomerchant).merchant_id = 1
    assert products(:nomerchant).valid?
  end

  test "Products can have orderitems" do
    assert_equal products(:goods).orderitems.length, 1
  end

  test "Products can have reviews" do
    assert_equal products(:goods).reviews.length, 5
  end

  #test for categories?

end

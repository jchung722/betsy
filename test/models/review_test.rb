require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "Rating must be present to be valid review and must correctly call attributes" do
    assert reviews(:best).valid?
    assert_equal reviews(:best).rating, 5
    assert_equal reviews(:best).feedback, "Awesome stuff :)"
    assert_equal reviews(:best).product, products(:goods)

    reviews(:best).rating = nil
    assert_not reviews(:best).valid?
  end

  test "Rating must be an integer between 1 and 5." do
    assert reviews(:average).valid?
    reviews(:average).rating = "one"
    assert_not reviews(:average).valid?
    reviews(:average).rating = 0
    assert_not reviews(:average).valid?
    reviews(:average).rating = 6
    assert_not reviews(:average).valid?
  end

  test "Review must belong to a product" do
    assert reviews(:worst).valid?
    reviews(:worst).product_id = nil
    assert_not reviews(:worst).valid?
  end

end

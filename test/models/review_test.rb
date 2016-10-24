require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "Rating must be present to be valid review." do
    assert reviews(:best).valid?
    assert_not reviews(:no_rating).valid?
  end

  test "Rating must be an integer between 1 and 5." do
    assert_not reviews(:no_integer).valid?
    assert_not reviews(:low_rating).valid?
    assert_not reviews(:high_rating).valid?
  end

  test "Review must belong to a product" do
    assert_not reviews(:no_product).valid?
  end

end

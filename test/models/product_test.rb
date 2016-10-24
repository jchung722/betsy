require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "Product with minimal information must be valid" do
    assert products(:goods).valid?
  end
end

require 'test_helper'

class MerchantsControllerTest < ActionController::TestCase

  test "should get index only for logged in merchants" do
    get :index
    assert_response :redirect
    assert_equal flash[:notice], "You must be logged in to access merchant section"
  end

  test "update operations for users not logged in as merchants will redirect" do
    put :update, :id => merchants(:merchant1), :merchant => {:displayname => "New Name"}
    assert_response :redirect
    assert_redirected_to homepages_index_path
  end

  
end

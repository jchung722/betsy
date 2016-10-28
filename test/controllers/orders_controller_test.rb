require 'test_helper'

class OrdersControllerTest < ActionController::TestCase

<<<<<<< HEAD
  test "should be able to get order index given a valid merchant id in session" do
=======
  test "can get order index page given a valid merchant id stored as the session user" do
>>>>>>> merchantimagefix
    session[:user_id] = merchants(:bob).id
    get :index
    assert_response :success
    assert_template :index
  end

<<<<<<< HEAD
  test "should redirect to main homepage if there is no merchant id in session" do
=======
  test "if no id is stored in the session, the order index page is not shown and user is redirected to the homepage" do
>>>>>>> merchantimagefix
    session[:user_id] = nil
    get :index
    assert_response :redirect
    assert_redirected_to homepages_index_path
    assert_equal flash[:notice], "You must be logged in to access merchant section"
  end

<<<<<<< HEAD
  test "should redirect to main homepage if there is an invalid merchant id in session" do
=======
  test "if a bad id is stored in the session, the order index page is not shown and user is redirected to the homepage" do
>>>>>>> merchantimagefix
    session[:user_id] = -1
    get :index
    assert_response :redirect
    assert_redirected_to homepages_index_path
    assert_equal flash[:notice], "You must be logged in to access merchant section"
  end

<<<<<<< HEAD
=======
  test "can get order show page if order id is valid and the right merchant is logged in" do
    session[:user_id] = merchants(:bob).id
    get :show, {id: orders(:testorder1).id}
    assert_response :success
    assert_template :show
  end

>>>>>>> merchantimagefix
  test "destroy on a valid order (unpurchased cart) should result in the appropriate redirect" do
    session[:order] = orders(:testorder1).id
    delete :destroy

    assert session[:order] == nil
    assert_response :redirect
    assert_redirected_to carts_index_path
  end

  test "destroy on a valid order (unpurchased cart) should result in a decrement of number of orders in the database" do
    assert_difference('Order.count', -1) do
      session[:order] = orders(:testorder1).id
      delete :destroy
    end
  end

  test "destroy on a valid order (unpurchased cart) should remove that order from the database" do
    session[:order] = orders(:testorder1).id
    assert Order.all.include?(orders(:testorder1))
    delete :destroy
    assert !Order.all.include?(orders(:testorder1))
  end

  test "destroy on an invalid order should result in an error code" do
    session[:order] = -1
    delete :destroy
    assert_response :missing
  end

  test "destroy on an invalid order should not decrement the number of orders in the database" do
    assert_difference('Order.count', 0) do
      session[:order] = -1
      delete :destroy
    end
  end

end

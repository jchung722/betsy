require 'test_helper'

class OrderitemsControllerTest < ActionController::TestCase
  test "create method should make a new order if there is no session order" do
    session[:order] = nil
    assert_difference('Order.count', 1) do
      post :create, {add_to_cart: {quantity: 1}, product_id: products(:farts).id, status: 'pending'}
    end
    # Confirm that the session order is now set to the order that holds our new orderitem (most recently added)
    assert session[:order]
    assert_equal session[:order].to_i, Orderitem.last.order.id
  end

  test "create method should not make a new order if there is an existing session order" do
    session[:order] = orders(:testorder1).id
    assert_difference('Order.count', 0) do
      post :create, {add_to_cart: {quantity: 1}, product_id: products(:farts).id, status: 'pending'}
    end
    assert_equal session[:order].to_i, orders(:testorder1).id
  end

  test "create method should make a new orderitem" do
    # Pre-existing order
    session[:order] = orders(:testorder1).id
    assert_difference('Orderitem.count', 1) do
      post :create, {add_to_cart: {quantity: 1}, product_id: products(:farts).id, status: 'pending'}
    end
    # No existing order
    session[:order] = nil
    assert_difference('Orderitem.count', 1) do
      post :create, {add_to_cart: {quantity: 1}, product_id: products(:farts).id, status: 'pending'}
    end
  end

  test "the new orderitem made by create should belong to the appropriate order" do
    # Existing order
    session[:order] = orders(:testorder1).id
    post :create, {add_to_cart: {quantity: 1}, product_id: products(:farts).id, status: 'pending'}
    assert_equal orders(:testorder1).id, Orderitem.last.order.id
    # No existing order
    session[:order] = nil
    post :create, {add_to_cart: {quantity: 1}, product_id: products(:farts).id, status: 'pending'}
    assert_equal session[:order].to_i, Orderitem.last.order.id
  end

  test "successful addition of the item should redirect to the product page with a confirmatory flash notice" do
    session[:order] = nil
    post :create, {add_to_cart: {quantity: 1}, product_id: products(:farts).id, status: 'pending'}
    assert_response :redirect
    assert flash[:notice] == "Item added to cart! Quantity: 1"
    assert_redirected_to products_show_path(products(:farts).id)
  end

  test "unsuccessful creation of an order should redirect to the product page with a descriptive flash notice" do
    # Case where the order stored in the session is not in the database
    session[:order] = -1
    post :create, {add_to_cart: {quantity: 1}, product_id: products(:farts).id, status: 'pending'}
    assert flash[:notice] == "The item was not added because your cart could not be found. Your cart has now been reset; please try adding the item again."
    assert_equal session[:order], nil
    # Case where necessary information is not provided, so the save of the orderitem fails
    session[:order] = nil
    post :create, {add_to_cart: {quantity: 1}, status: 'pending'}
    assert flash[:notice] == "There was an error adding the item to your cart. Please try again."
    assert_equal session[:order], nil

  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end

class ProductsController < ApplicationController
  def index
    @browse_by = "Merchant"
  end

  def show
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: params[:id])

    @already_in_cart = session[:order] && Order.find(session[:order]).has_product(@product.id)

    if @already_in_cart
      @orderitem = Orderitem.new(quantity: 1) # To display the 1 in the form
      @existing_orderitem = Orderitem.find_by(product: @product)
      @url = orderitems_update_path(@existing_orderitem)
      @method = :patch
    else
      @orderitem = Orderitem.new(quantity: 1)
      @url = orderitems_create_path(params[:id]) # Passing in the product id so we can make a new orderitem
      @method = :post
    end

  end

  def new
  end

  def create
  end
end

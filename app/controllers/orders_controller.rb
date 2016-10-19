class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
    order = Order.create
    order.orderitems << Orderitem.create(quantity: 1, product_id: params[:product_id])
    session[:order] = order.id
    flash[:notice] = "Item added to cart!"
    redirect_to products_show_path(params[:product_id])
  end

  def show
  end

  def destroy
  end

  def update
  end

end

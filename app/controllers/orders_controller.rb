class OrdersController < ApplicationController
  def index
    @orders = Merchant.find(session[:user_id].to_i).products.orders
  end

  def new
  end

  def create
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    order = Order.find_by(id: session[:order])

    if order
      order.destroy
    end

    session[:order] = nil
    redirect_to carts_index_path
  end

  def update

  end

end

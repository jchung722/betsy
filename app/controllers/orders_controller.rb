class OrdersController < ApplicationController
  def index
    merchant = Merchant.find_by(id: session[:user_id].to_i)
    products = merchant.products
    @orders = []
    products.each do |product|
      product.orderitems.each do |orderitem|
        if !@orders.include?(orderitem.order)
          @orders << orderitem.order
        end
      end
    end

  end

  def new
  end

  def create
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    begin
      @order = Order.find(session[:order])
      @order.destroy
      session[:order] = nil
      redirect_to carts_index_path
    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def update

  end

end

class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
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

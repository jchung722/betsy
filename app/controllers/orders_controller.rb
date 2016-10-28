class OrdersController < ApplicationController
  before_action :require_merchant, only: [:index, :show]
  has_scope :status
  def index
    apply_scopes(Order).all
    merchant = Merchant.find_by(id: session[:user_id].to_i)
    @orders = merchant.orders
  end

  def new
  end

  def create
  end

  def show
    @order = Order.find(params[:id])
    @orderitems = @order.find_merchant_order_items(session[:user_id])
  end

  def destroy
    begin
      @order = Order.find(session[:order])
      @order.destroy_items
      @order.destroy
      session[:order] = nil
      redirect_to carts_index_path
    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def update

  end

  def complete
    @order = Order.find(params[:id])
    @order.status = "complete"
    @order.save

    redirect_to orders_show_path
  end

end

class CartsController < ApplicationController
  def index
    if session[:order]
      @order = Order.find(session[:order])
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end
end

class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
    order = Order.create(status: 'pending')
    order.orderitems << Orderitem.create(quantity: 1, product_id: params[:product_id])
    session[:order] = order.id
    flash[:notice] = "Item added to cart!"
    redirect_to products_show_path(params[:product_id])
  end

  def show
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
    order = Order.find(session[:order])
    already_in_order = false

    order.orderitems.each do |orderitem|
      if orderitem.product.id == params[:product_id].to_i
        already_in_order = true
        orderitem.quantity += 1
        orderitem.save
        break
      end
    end

    if !already_in_order
      order.orderitems << Orderitem.create(quantity: 1, product_id: params[:product_id])
    end

    flash[:notice] = "Item added to cart!"
    redirect_to products_show_path(params[:product_id])
  end

end

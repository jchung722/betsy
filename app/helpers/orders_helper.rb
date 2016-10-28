module OrdersHelper

  def final_total(array)
    total = 0

    array.each do |item|
      total += item.total
    end

    return total
  end

  def total(orders_array)
    total = 0
    orders_array.each do |order|
      total += final_total(order.find_merchant_order_items(session[:user_id]))
    end
    return total
  end

  def complete_check(array)
    array.each do |item|
      if item.status == "pending"
        return false
      end
    end
    return true
  end
end

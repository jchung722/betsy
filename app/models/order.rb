class Order < ActiveRecord::Base
  has_many :orderitems

  validates :orderitems,
            presence: true

  def total
    total = 0

    self.orderitems.each do |orderitem|
      total += orderitem.total
    end

    return total
  end

  def totals
    total = 0
    self.each do |orderitem|
      total += orderitem.total
    end
    return total
  end

  def has_product (product_id)

    self.orderitems.each do |orderitem|
      if orderitem.product.id == product_id
        return true
      end
    end

    return false

  end

  # Reduce the stock of each item when it is sold

  def update_stock

    self.orderitems.each do |orderitem|
      product = orderitem.product
      product.stock -= orderitem.quantity
      product.save
    end

  end

  def find_merchant_order_items(user_id)
    orderitems = []
    self.orderitems.each do |orderitem|
      if orderitem.product.merchant_id == user_id.to_i
        orderitems << orderitem
      end
    end
    return orderitems
  end
end

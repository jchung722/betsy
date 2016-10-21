class Orderitem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  def total
    return self.quantity * self.product.price
  end

  def price
    return self.product.price
  end
  
end

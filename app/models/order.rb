class Order < ActiveRecord::Base
  has_many :orderitems

  def total

    total = 0

    self.orderitems.each do |orderitem|
      total += orderitem.total
    end

    return total

  end

end

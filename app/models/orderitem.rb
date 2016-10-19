class Orderitem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity,
            numericality: { only_integer: true, greater_than: 0 }
end

class Product < ActiveRecord::Base
  belongs_to :merchant
  has_many :orderitems
  has_many :reviews
end

class Merchant < ActiveRecord::Base
  has_many :products

  def self.build_from_github(auth_hash)
    merchant       = Merchant.new
    merchant.uid   = auth_hash[:uid].to_i
    merchant.provider = 'github'
    merchant.username  = auth_hash['info']['name']
    merchant.email = auth_hash['info']['email']

    return merchant
  end

  validates :username,
            presence: true,
            uniqueness: true

  validates :email,
            presence: true,
            uniqueness: true
end

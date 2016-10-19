class MerchantsController < ApplicationController
  before_action :find_merchant, except: [:new, :create]

  def index
  end

  def show
    @browse_by = find_merchant
    @type = "category"
    @path = "merchant_show_path"
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def find_merchant
    @merchant = Merchant.find(params[:id].to_i)
  end
end

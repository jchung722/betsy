class MerchantsController < ApplicationController
  before_action :find_merchant, except: [:new, :create]

  def index
  end

  def show
    @browse_by = find_merchant
    @type = "product"
    @path = "merchant_show_path"
  end

  def new

  end

  def create
    @merchant.name = params[:merchant][:title]
    @merchant.address = params[:merchant][:address]
    @merchant.phone = params[:merchant][:address]
    @merchant.save
    redirect_to merchant_index_path(@merchant.id)
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

class MerchantsController < ApplicationController
  before_action :find_merchant, except: [:new, :create]

  def index
      # @merchant = Merchant.find_by(session[:id].to_i)
  end

  def show
    @browse_by = find_merchant
    @type = "product"
    @path = "merchant_show_path"
  end

  def new

  end

  def create
    @merchant.displayname = params[:merchant][:title]
    @merchant.location = params[:merchant][:address]
    @merchant.phone = params[:merchant][:address]
    @merchant.save
    redirect_to merchant_index_path(@merchant.id)
  end

  def edit

  end

  def update
    @merchant.displayname = params[:merchant][:title]
    @merchant.location = params[:merchant][:address]
    @merchant.phone = params[:merchant][:address]
    @merchant.save
    redirect_to merchant_index_path(@merchant.id)
  end

  private

  def find_merchant
    @merchant = Merchant.find_by(session[:user_id].to_i)
  end
end

class MerchantsController < ApplicationController
  before_action :find_merchant, except: [:new, :create]
  before_action :require_merchant, only: [:new, :create, :update]

  def index
      # @merchant = Merchant.find_by(session[:id].to_i)
  end

  def show
  
  end

  def new

  end

  def create

  end

  def edit

  end

  def update
    @merchant.displayname = params[:merchant][:displayname]
    @merchant.location = params[:merchant][:location]
    @merchant.phone = params[:merchant][:phone]
    @merchant.save
    redirect_to merchant_index_path(@merchant.id)
  end

  private

  def find_merchant
    @merchant = Merchant.find_by(id: session[:user_id].to_i)
  end
end

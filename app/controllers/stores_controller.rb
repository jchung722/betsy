class StoresController < ApplicationController
  def index
    @stores = Merchant.all
  end

  def show
    begin
      @store = Merchant.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
    end
    @products = active_products.select {|product| product.merchant_id == @store.id}
  end

end

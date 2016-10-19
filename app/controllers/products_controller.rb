class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: params[:id])
  end

  def new
  end

  def create
  end
end

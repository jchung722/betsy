class CategoriesController < ApplicationController
  before_action :require_merchant, only: [:new, :create]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category.name = params[:category][:name]
    @category.save
    redirect_to product_edit_path
  end

  def show
    @category = Category.find(params[:id].to_i)
  end

  def destroy
  end
end

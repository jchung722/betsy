class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
  end

  def create
  end

  def show
    @browse_by = Category.find(params[:id])
    @type = "category"
    @path = "categories_show_path"
  end

  def destroy
  end
end

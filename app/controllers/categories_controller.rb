class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    # Should be built out in merchant branch
  end

  def create
    # Should be built out in merchant branch
  end

  def show
    begin
      @browse_by = Category.find(params[:id].to_i)
      @type = "category"
      @path = "categories_show_path"
    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def destroy
  end
end

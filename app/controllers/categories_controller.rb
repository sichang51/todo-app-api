class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render :index
  end

  def create
    @category = Category.create(
      name: params[:name],
    )
    render :show
  end
end

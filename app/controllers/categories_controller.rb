class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to "/categories"
    end
  end

  def edit
  end

  def show
  end

  def update
    if @category.update!(category_params)
      redirect_to "/categories/#{params[:id]}"
    end
  end

  def destroy
    @category.destroy
    redirect_to "/categories"
  end

  def today
    @tasks = Task.where(date: Date.today).sort_by {
      |task| task.time
    }
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end

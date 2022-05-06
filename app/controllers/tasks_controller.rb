class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :get_category

  def index
    @tasks = @category.tasks.sort_by {
      |task| task.date
    }
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save!
      redirect_to category_tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @task.update!(task_params)
      redirect_to "/categories/#{@category.id}/tasks/#{params[:id]}"
    end
  end

  def destroy
    @task.destroy
    redirect_to "/categories/#{@category.id}/tasks/"
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end
  
  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :date, :time, :location, :notes, :category_id)
  end
end

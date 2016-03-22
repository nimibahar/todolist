class TasksController < ApplicationController
  def create
    attrs = task_params
    @task = Task.create(attrs)
    redirect_to task_path(@task)
  end

  def show
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def new
    @task = Task.new
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)

  end
end

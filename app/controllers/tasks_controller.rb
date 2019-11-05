class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    # render index.html.erb
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # for the form
    @task = Task.new
  end

  def create
    # save to DB
    @task = Task.new(task_params) # strong params!
    if @task.save
      redirect_to task_path(@task)
    else
      # redirect_to new_restaurant_path
      render :new # new.html.erb
    end
  end

  def edit # our form
  end

  def update # updating the DB
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit # edit.html.erb
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    # params[:task] -> permit name, address, raint
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

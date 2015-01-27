class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def create
    @task = current_user.tasks.create(task_params)
    flash[:notice] = 'Your project successfully created.'
    respond_with(@task)
  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    def set_task
      @task = Project.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :deadline, :done)
    end
end

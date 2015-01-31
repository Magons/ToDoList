class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :find_project, only: [:create, :destroy]
  before_action :authenticate_user!

  respond_to :js

  def show
  end

  def create
    @task = current_user.tasks.create(task_params.merge(project: @project))
    flash[:notice] = 'Your project successfully created.'
    respond_with(@task)
  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    flash[:notice] = 'Your project successfully delete.'
    respond_with(@task)
  end

  private

    def find_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :deadline, :done)
    end
end

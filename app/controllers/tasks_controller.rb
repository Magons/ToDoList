class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :task_up, :task_down]
  before_action :find_project, only: [:create, :destroy, :task_up, :task_down]
  before_action :authenticate_user!

  respond_to :js

  def create
    @task = current_user.tasks.create(task_params.merge(project_id: @project.id, prioritise: @project.tasks.count + 1))

    flash.now[:notice] = 'Your task successfully created.'
    respond_with(@task)
  end

  def update
    if @task.update(task_params)
      flash.now[:notice] = 'Task was successfully updated.'
      render nothing: true, status: 200
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    flash.now[:notice] = 'Your task successfully delete.'
    respond_with(@task)
  end

  def task_up
    @task.task_prioritise(@project.id, -1)
  end

  def task_down
    @task.task_prioritise(@project.id, 1)
  end

  private

    def find_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :done)
    end
end

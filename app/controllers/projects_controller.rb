class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    @project.save
    flash.now[:notice] = 'Project was successfully create.'
  end

  def update
    if @project.update(project_params)
     flash.now[:notice] = 'Project was successfully updated.'
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

 
  def destroy
    @project.destroy
    flash.now[:notice] = 'Project was successfully destroyed.'
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.permit(:title)
    end
end


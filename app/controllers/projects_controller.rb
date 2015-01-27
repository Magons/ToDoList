class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @projects = Project.all()
  end

  def create
    @project = current_user.projects.create(project_params)
    flash[:notice] = 'Your project successfully created.'
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title)
    end
end


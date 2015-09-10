class ProjectsController < ApplicationController

  def index
    @projects = Project.last_updated(40)
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project created successfully"
      redirect_to project_path(@project.id)
    else
      @project.errors.messages
      render :new
    end
  end

  def new
    #es necesario para el helper. Asigna los inputs a una intancia.
    @project = Project.new
    render :new
  end

  def show
    id = params[:id]
    @project = Project.find_by(id: id)
    @entries = @project.entries
    if @project.nil?
      render :no_project_found
    else
      render :show
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end

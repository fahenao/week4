class ProjectsController < ApplicationController

  def index
    @projects = Project.last_updated(10)
  end

  def show
    id = params[:id]
    @project = Project.find_by(id: id)
    if @project.nil?
      render :no_project_found
    else
      render :show
    end
  end


  def new
    #es necesario para el helper. Asigna los inputs a una intancia.
    @project = Project.new
    render :new
  end

  def create
    title = params[:project][:title]
    description = params[:project][:description]
    @project = Project.new(title: title, description: description)
    if @project.save
      redirect_to "/projects/#{@project.id}"
    else
      @project.errors.messages
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

end

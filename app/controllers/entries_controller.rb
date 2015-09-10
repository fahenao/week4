class EntriesController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new(entry_params)
    if @entry.save
      redirect_to project_path(@project)
    else
      @entry.errors.messages
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to project_path(@entry.project)
    #redirect_to action: "show", id: entry.project_id, controller: "projects"
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new
  end

  def update
    @entry = Entry.find(params[:id])
    project = @entry.project_id
    if @entry.update(entry_params)
      redirect_to project_path(@entry.project)
    else
      render :edit
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:hour, :minute, :created_at, :comment)
  end
end

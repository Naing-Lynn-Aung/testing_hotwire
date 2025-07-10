class ProjectsController < ApplicationController
  before_action :set_project, only: [ :edit, :update, :destroy, :show ]
  def index
    @projects = Project.all
    @projects = @projects.search(params[:search]) if params[:search].present?
    @pagy, @projects = pagy @projects
    @project = Project.new
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def show
    @task = @project.tasks.build
  end

  def create
    @project = Project.create(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: "Project was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: "Project was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy!
    @projects = Project.all
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to projects_path }
    end
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end
  def project_params
    params.require(:project).permit(:title, :content, :start, :end, :vote)
  end
end

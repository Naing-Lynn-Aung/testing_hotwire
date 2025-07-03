class TasksController < ApplicationController
  before_action :project_id, only: [ :create, :edit ]
  before_action :task_id, only: [ :edit, :update, :destroy, :show ]
  def create
    @task = @project.tasks.build(tasks_params)
    if @task.save
      flash[:notice] = "Task successfully created"
      redirect_to project_path(@project)
    else
      flash[:alert] = "Task has not been created"
      render "project/show"
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(tasks_params)
        format.html { redirect_to([ @task.project, @task ], notice: "Task was successfully updated") }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@task, partial: "tasks/form", locals: { task: @task }) }
        format.html { render :edit }
      end
    end
  end

  def show

  end

  def destroy
    @task.destroy!
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@task) }
      format.html { project_path(@project) }
    end
  end

  private

  def task_id
    @task = Task.find(params[:id])
  end

  def project_id
    @project = Project.find(params[:project_id])
  end

  def tasks_params
    params.require(:task).permit(:body, :status, user_ids: [])
  end
end

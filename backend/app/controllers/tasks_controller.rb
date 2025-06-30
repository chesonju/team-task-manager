class TasksController < ApplicationController
  def index
    tasks = @current_user.tasks
    render json: tasks
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.assignee = current_user
    @task.department = current_user.team.department

    if @task.save
      render json: @task, status: :created
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    task = @current_user.tasks.find(params[:id])
    if task.update(task_params)
      render json: task
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    task = @current_user.tasks.find(params[:id])
    task.destroy
    render json: { message: 'Task deleted' }
  end

  private

  def task_params
    params.require(:task).permit(:title, :status, :workspace_id)
  end
end

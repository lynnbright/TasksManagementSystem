class TasksController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    #未來會加上分頁功能
  end

  def new
    @task = Task.new
  end

  def show
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: I18n.t("message.create_success")
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_path, notice: I18n.t("message.update_success")
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to root_path, notice: I18n.t("message.deleted")
    else
      flash[:notice] = I18n.t("message.fail_to_delete")
    end
  end

  private
  def find_params
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, 
                                 :description, 
                                 :status,
                                 :priority,
                                 :start_at,
                                 :end_at) 
  end
end

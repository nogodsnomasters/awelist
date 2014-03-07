class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_favorite]
  
  
  def create
    @task = @list.tasks.create(task_params)
    if @task.save
       redirect_to @list, notice: 'Task was successfully created.'
    else
       render 'lists/show' 
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @list, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end  
  
  def toggle_favorite
    Task.transaction do
      @task.starred = !@task.starred
      @task.save 
    end 
    redirect_to @list
  end
  
  def toggle_complete
    Task.transaction do
      @task.complete = !@task.complete
      @task.save
    end
    redirect_to @list
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:list_id])
    end
    
    def task_params
      params.require(:task).permit( :name, :complete, :starred, :date_due )
    end
    
    def set_task
      @task = @list.tasks.find(params[:id])
    end
    
end

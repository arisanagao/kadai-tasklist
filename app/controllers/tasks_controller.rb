class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

   def index
 	  @tasks = Task.all   end
 	  
   def show
 	  set_task
 	end
 	  
   def new
   	@task = Task.new
	end
   	
 	
   def create
     @task = Task.new(task_params)

     if @task.save
       flash[:success] = '新規タスクが正常に投稿されました'
       redirect_to @task
     else
       flash.now[:danger] = '新規タスクが投稿されませんでした'
       render :new
     end
   end
   
   
   def edit
 	  set_task
 	end
 	
 	
 def update
   set_task

     if @task.update(task_params)
       flash[:success] = 'タスク は正常に更新されました'
       redirect_to @task
     else
       flash.now[:danger] = 'タスク は更新されませんでした'
       render :edit
     end
   end  
 
   def destroy
     set_task
     @task.destroy
 
     flash[:success] = 'タスク は正常に削除されました'
     redirect_to tasks_url
   end
 
 end
 
 
 
   private
 
   # Strong Parameter
   def task_params
     params.require(:task).permit(:content, :status)
   end
   
  def set_task
    @task = Task.find(params[:id])
  end
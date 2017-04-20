class TasksController < ApplicationController
   before_action :require_user_logged_in
 before_action :set_task, only: [:show, :edit, :update, :destroy]
   before_action :correct_user, only: [:destroy, :edit]


 def index
 	 # @tasks = Task.order(created_at: desc).page(params[:page])
 end
 	  
 def show
 end
 	  
 def new
  @task = Task.new
 end
	
	
	def create
	 @task = current_user.tasks.build(task_params)	 
	#  @task = Task.new(task_params)
	  if @task.save
	    flash[:success] = '新規タスクが正常に投稿されました'
	    redirect_to root_path
	 #   redirect_to @task
	    else
	      flash.now[:danger] = '新規タスクが投稿されませんでした'
	      render :new
	   end
	end
	
	def edit
 return redirect_to :root if @task.nil?
	end
 	
 	
 	def update
 	  if @task.update(task_params)
 	    flash[:success] = 'タスク は正常に更新されました'
 	    redirect_to @task
 	    else
 	      flash.now[:danger] = 'タスク は更新されませんでした'
 	      render :edit
 	  end
 	end  
 
  def destroy
   return redirect_to :root if @task.nil?
   @task.destroy
     flash[:success] = 'タスク は正常に削除されました'
    #redirect_to tasks_url
     redirect_to root_path
  end
 
 private
 
 # Strong Parameter
  def task_params
   params.require(:task).permit(:content, :status)
  end
   
  def set_task
    @task = Task.find(params[:id])
   end
   
  
    def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
    
    end
  end
  
  
end
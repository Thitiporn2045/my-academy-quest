class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_categories, only: [:new, :edit, :create, :update]
  # GET /tasks or /tasks.json
  def index
    @categories = Task.distinct.pluck(:category)
    @tasks      = Task.order(:deadline)
  end

  def by_category
    @categories = Task.distinct.pluck(:category)
    @category   = params[:category]

    @tasks = if @category.present?
              Task.where(category: @category).order(:deadline)
            else
              Task.where(category: [nil, '']).order(:deadline)
            end
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end
  
  def edit
    @task = Task.find(params[:id])
  end  

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_path, status: :see_other, notice: "ลบงานเรียบร้อยแล้ว" }
      format.json { head :no_content }
    end
  end

  def toggle_done
    @task = Task.find(params[:id])
    @task.update(done: !@task.done)
    redirect_to tasks_path, notice: "Task updated"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :done, :category, :assigned_at, :deadline)
    end

    def set_categories
      @categories = Task.distinct.pluck(:category).compact_blank
    end
end

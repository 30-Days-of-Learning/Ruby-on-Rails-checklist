class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)

    @todo.save
    redirect_to todos_path
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render 'edit'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])

    @todo.destroy
    redirect_to todos_path
  end

  def complete
    @todo = Todo.find(params[:id])

    if @todo.completed?
      if @todo.update(completed: false)
        redirect_to todos_path
      else
        render 'edit'
      end
    else
      if @todo.update(completed: true)
        redirect_to todos_path
      else
        render 'edit'
      end
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:title, :notes, :completed, :duedate)
    end
end

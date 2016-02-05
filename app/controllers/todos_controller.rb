class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
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

  private
    def todo_params
      params.require(:todo).permit(:title, :notes, :completed)
    end
end

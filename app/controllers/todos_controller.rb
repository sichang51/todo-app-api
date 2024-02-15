class TodosController < ApplicationController
  def index
    @todos = Todo.all
    render :index
  end

  def create
    @todo = Todo.create(
      title: params[:title],
      description: params[:description],
      deadline: params[:deadline],
      completed: params[:completed],
    )
    render :show
  end

  def show
    @todo = Todo.find_by(id: params[:id])
    render :show
  end

  def update
    @todo = Todo.find_by(id: params[:id])
    @todo.update(
      title: params[:title] || @todo.title,
      description: params[:description] || @todo.description,
      deadline: params[:deadline] || @todo.deadline,
      completed: params[:completed] || @todo.completed,
    )
    render :show
  end

  def destroy
    @todo = Todo.find_by(id: params[:id])
    @todo.destroy
    render json: { message: "Todo destroyed successfully" }
  end
end



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
end

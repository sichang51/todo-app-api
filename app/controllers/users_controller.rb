class UsersController < ApplicationController
  def index
    @users = User.All
    render :index
  end
end

class AdminsController < ApplicationController
  def edit
  end

  def update
  end

  def show
  end

  def user_history
  end

  def user_index
    @users = User.search(params[:search])
  end

  def user_search
  end
end

class UsersController < ApplicationController
  def show
    @user = User.all
    @users = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def help
  end

  def adress
  end

  def create_address
  end

  def select
  end
end

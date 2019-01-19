class UsersController < ApplicationController
  def show
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
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

  private
  def user_params
    params.require(:user).permit(:name, :hundle_name, :name_kana, :postal_code, :user_address, :phone_number, :profile_image)
  end

end

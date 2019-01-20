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

  def confirm_order
    @cart_items = current_user.carts.all.last.cart_items
    @cart = current_user.carts.all.last
    @sum = sum(@cart_items)
  end

  def new_address
    @address = Address.new
  end

  def create_address
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    if @address.save
    redirect_to users_confirm_order_path
    else
      render 'new_address'
    end
  end

  def edit_address
  end

  def update_address
  end

  def destroy_address
  end

  def buy
    current_user.carts.all.last.update(buy_params)
    redirect_to users_thanks_path
  end

  def select
  end

  private
  def user_params
    params.require(:user).permit(:name, :hundle_name, :name_kana, :postal_code, :user_address, :phone_number, :profile_image)
  end

  def address_params
    params.require(:address).permit(:other_name, :other_postal_code, :other_address)
  end

  def buy_params
    params.require(:cart).permit(:address_id, :total_price, :status, :added_at)
  end
end

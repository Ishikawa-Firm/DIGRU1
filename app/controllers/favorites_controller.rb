class FavoritesController < ApplicationController
  def create
  	@product = Product.find(params[:product_id])
  	@favorite = current_user.favorites.new(product_id: @product.id, user_id: @user_id)
  	@favorite.save
    redirect_to product_path(@product.id)
  end

  def destroy
  	@product = Product.find(params[:product_id])
  	@favorite = current_user.favorites.find_by(product_id: @product.id)
  	@favorite.destroy
    redirect_to product_path(@product.id)
  end
end

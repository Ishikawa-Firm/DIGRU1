class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = current_user.comments.new(product_id: @product.id, user_id: @user_id)
    @comment.product_id = @product.id
    @comment.save
    redirect_to product_path(@product.id)
  end

  def update
    @product = Product.find(params[:product_id])
    @comment = current_user.comments.find_by(product_id: @product.id)
    @comment.update
    redirect_to product_path(@product.id)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = current_user.comments.find_by(product_id: @product.id)
    @comment.destroy
    redirect_to product_path(@product.id)
  end

  private
  def comment_params
  params.require(:comment).permit(:user_id,
                                  :product_id, :comment_text)
  end
end



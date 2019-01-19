class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to products_path
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
  params.require(:comment).permit(:user_id, :product_id, :comment_text)
  end
end

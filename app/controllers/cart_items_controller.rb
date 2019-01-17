class CartItemsController < ApplicationController
	def add_item
		if session[:cart_id]
			@cart = Cart.find(session[:cart_id])
		else
			@cart = Cart.new
			@cart.user_id = current_user.id
			@cart.save
			session[:cart_id] = @cart.id
		end
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.cart_id = @cart.id
		if @cart_item.save
			redirect_to cart_path(@cart), flash: {key: "#{@cart_item.product.name}をカートに追加しました．"}
		else
			#render先のアクションが持っているインスタンス変数を持っていく．持っていきたい値「product_id」は「cart_item」の中にあるので，2つ続けて書く．
			@product = Product.find(params[:cart_item][:product_id])
			render 'products/show'
		end
	end

	def update_item
		@cart_item = CartItem.find(params[:id])
		if @cart_item.update(cart_item_params)
        	redirect_to cart_path(@cart_item.cart), flash: {key: "#{@cart_item.product.name}の数量が#{@cart_item.quantity}個に変更されました．"}
        else
        	@cart_items = CartItem.where(cart_id: @cart_item.cart.id)
        	render 'carts/show'
        end
    end

	def destroy_item
		@cart_item = CartItem.find(params[:id])
		if @cart_item.destroy
        	redirect_to cart_path(@cart_item.cart), flash: {key: "#{@cart_item.product.name}をカートから削除しました．"}
    	else
        	render 'carts/show'
        end
	end

	private
		def cart_item_params
			params.require(:cart_item).permit(:product_id, :price, :quantity)
		end
end
class CartItemsController < ApplicationController
	def add_item
	#sessionにcartを保存するやり方
		# session[:cart_id] = nil  ← 1回カートを作った後に "$ db:migrate:reset" をした場合に，コメントアウトして使ってください．
									# migrate:resetしても，cart_idに限っては session に残ってしまう（session[:cart_id]を使って session に保存しているため．）ので，session[:cart_id]を1度nilにしてカートを消し，またコメントアウトして商品を追加すればエラーが消えます．．
		# if  session[:cart_id].nil?
		# 	@cart = Cart.new
		# 	@cart.user_id = current_user.id
		# 	@cart.save
		# 	session[:cart_id] = @cart.id
		# else
		# 	@cart = Cart.find(session[:cart_id])
		# end
	#sessionにcartを保存するやり方?
		if current_user.carts.empty? || current_user.carts.all.last.added_at
			current_cart = Cart.new(user_id: current_user.id)
			current_cart.save
		else
			current_cart = current_user.carts.all.last
		end

		if current_cart.cart_items.empty?
			@cart_item = CartItem.new(cart_item_params)
			@cart_item.cart_id = current_cart.id
		else
			@cart_items = current_cart.cart_items
			if  !@cart_items.where(["product_id = ?", params[:cart_item][:product_id]]).empty? #whereでproduct_idを探す
				@cart_item = @cart_items.find_by(["product_id = ?", params[:cart_item][:product_id]]) #find_byで特定のidを指定
				@cart_item.quantity += params[:cart_item][:quantity].to_i
			else
				@cart_item = CartItem.new(cart_item_params)
				@cart_item.cart_id = current_cart.id
			end
		end

		if @cart_item.save
			redirect_to cart_path(current_cart), flash: {key: "#{@cart_item.product.name}をカートに追加しました．"}
		else
			#render先のアクションが持っているインスタンス変数を持っていく．持っていきたい値「product_id」は「cart_item」の中にあるので，2つ続けて書く．
			@product = Product.find(params[:cart_item][:product_id])
			render 'products/show'
		end
	end

	def update_item
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		if @cart_item.product.artist_id == current_artist
			redirect_to artists_product_history_path, flash: {key: "ＯＫ！"}
		else
			redirect_to cart_path(@cart_item.cart), flash: {key: "#{@cart_item.product.name}の数量が#{@cart_item.quantity}個に変更されました．"}
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

	def edit
		@cart_item = CartItem.find(params[:id])
		@user = @cart_item.cart.user.addresses.find_by(["id = ?", @cart_item.cart.address_id])
	end

	private
		def cart_item_params
			params.require(:cart_item).permit(:product_id, :price, :quantity, :status)
		end
end
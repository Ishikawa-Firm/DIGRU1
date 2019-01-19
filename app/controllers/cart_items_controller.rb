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
	#sessionにcartを保存するやり方

		if  Cart.all.last.added_at
			cart = Cart.new(user_id: current_user.id)
			cart.save
		else
			cart = Cart.all.last
		end

		# 以下の1行は，28〜35行目と同義だが，if文を書かないと使えないらしい
		# is_find = current_user.carts.last.cart_items.find_by(product_id: params[:cart_item][:product_id]).product_id

		@cart_items = current_user.carts.last.cart_items
		is_find = 0
		@cart_items.each do |cart_item|
			product = cart_item.product
			if params[:cart_item][:product_id].to_i == product.id
				is_find = cart_item.id
			else
				is_find = 0
			end
		end

		if is_find == 0
			@cart_item = CartItem.new(cart_item_params)
			@cart_item.cart_id = cart.id
		else
			@cart_item = CartItem.find(is_find)
			@cart_item.quantity += params[:cart_item][:quantity].to_i
		end

		if @cart_item.save
			redirect_to cart_path(cart), flash: {key: "#{@cart_item.product.name}をカートに追加しました．"}
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
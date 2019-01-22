class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when User
      products_path
    when Artist
      artist_path(current_artist.id)
    end
  end

  def after_sign_out_path_for(resource)
    products_path
  end

  # cart_items controller
  def sum(obj)
    sum = 0
    obj.each do |o|
      sum += o.sub_total
    end
    return sum
  end
  # cart_items controller

  def cart_empty
    cart_empty = current_user.carts.all.last.id
  end

  protected

	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:hundle_name, :name, :name_kana, :postal_code, :user_address, :phone_number])
	end

end
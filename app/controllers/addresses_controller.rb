class AddressesController < ApplicationController
  def show
    @addresses = current_user.addresses.all
  end
end


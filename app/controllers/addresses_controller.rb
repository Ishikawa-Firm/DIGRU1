class AddressesController < ApplicationController
  def show
    @addresses = Address.find(params[:id])
  end
end

# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :authenticate_user!

  def create
    address = Address.create!(address_params)
    render status: :created, json: address
  end

  private

  def address_params
    params.require(:address).permit(:supplier_id, :address_type, :street_address, :city, :state, :country, :zip_code, :phone_number)
  end
end

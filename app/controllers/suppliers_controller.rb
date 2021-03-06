# frozen_string_literal: true

class SuppliersController < ApplicationController
  before_action :authenticate_user!, except: %i[show addresses]

  def show
    supplier = Supplier.friendly.find(params[:id])
    render json: supplier
  end

  def create
    supplier = Supplier.create!(supplier_params.merge(user: current_user))
    render status: :created, json: supplier
  end

  def update
    supplier = Supplier.friendly.find(params[:id])
    authorize supplier
    supplier.update!(supplier_params)

    render json: supplier
  end

  def addresses
    supplier = Supplier.friendly.find(params[:id])
    render json: supplier.addresses
  end

  def answers
    supplier = Supplier.friendly.find(params[:id])
    render json: supplier.answers
  end

  private

  def format(hash)
    output = Hash.new
    hash.each do |key, value|
      output[key] = cleanup(value)
    end
    output
  end


  def supplier_params
    params.require(:supplier).permit(:user_id, :name, :description, :website, :email, :cnpj, :company_name, :municipal_subscription, :state_subscription, :phone, :company_revenue, :number_of_employees, :reach, :image_url, :type_of_company, addresses_attributes: [:state, :city, :address_type, :street_address, :country, :zip_code, :phone_number, :id])
  end
end

# frozen_string_literal: true

class SuppliersController < ApplicationController
  before_action :authenticate_user!

  def create
    supplier = Supplier.create!(supplier_params.merge(user: current_user))
    render status: :created, json: supplier
  end

  private

  def supplier_params
    params.require(:supplier).permit!
  end
end

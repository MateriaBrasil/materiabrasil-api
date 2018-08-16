# frozen_string_literal: true

class AddSupplierToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_reference :materials, :supplier, foreign_key: true
  end
end

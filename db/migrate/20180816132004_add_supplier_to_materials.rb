# frozen_string_literal: true

class AddSupplierToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_reference :materials, :supplier, foreign_key: true
    remove_column :materials, :supplier_name, :string
    remove_column :materials, :supplier_contact, :text
  end
end

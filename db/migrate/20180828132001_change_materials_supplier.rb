# frozen_string_literal: true

class ChangeMaterialsSupplier < ActiveRecord::Migration[5.2]
  def change
    remove_column :materials, :manufacturing_location, :string
    remove_column :materials, :sales_location, :string
    change_column_null :materials, :supplier_id, true
  end
end

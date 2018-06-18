# frozen_string_literal: true

class AddFieldsToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :supplier_name, :string
    add_column :materials, :supplier_contact, :text
    add_column :materials, :manufacturing_location, :string
    add_column :materials, :sales_location, :string
    add_column :materials, :technical_specification_url, :string
    add_column :materials, :properties, :text
    add_column :materials, :usage, :text
  end
end

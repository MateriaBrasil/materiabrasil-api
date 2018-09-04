# frozen_string_literal: true

class AddMoreFieldsToMaterials < ActiveRecord::Migration[5.2]
  def change
    remove_column :materials, :properties, :text
    add_column :materials, :unit_of_sale, :string
    add_column :materials, :minimum_purchase_quantity, :integer
    add_column :materials, :maximum_purchase_quantity, :integer
    add_column :materials, :ncm_code, :string
    add_column :materials, :sh_code, :string
    add_column :materials, :certifications, :text
    add_column :materials, :prizes, :text
    add_column :materials, :density, :string
    add_column :materials, :dimensions, :string
  end
end

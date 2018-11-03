# frozen_string_literal: true

class AddDriversToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :materiality_driver, :decimal
    add_column :materials, :manufacture_driver, :decimal
    add_column :materials, :management_driver, :decimal
    add_column :materials, :social_driver, :decimal
  end
end

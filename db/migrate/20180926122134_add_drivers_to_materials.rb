# frozen_string_literal: true

class AddDriversToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :first_driver, :decimal
    add_column :materials, :second_driver, :decimal
    add_column :materials, :third_driver, :decimal
    add_column :materials, :fourth_driver, :decimal
  end
end

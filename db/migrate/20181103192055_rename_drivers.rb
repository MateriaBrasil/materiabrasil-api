# frozen_string_literal: true

class RenameDrivers < ActiveRecord::Migration[5.2]
  def change
    rename_column :materials, :first_driver, :materiality_driver
    rename_column :materials, :second_driver, :manufacture_driver
    rename_column :materials, :third_driver, :management_driver
    rename_column :materials, :fourth_driver, :social_driver
  end
end

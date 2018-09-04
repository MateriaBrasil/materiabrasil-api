# frozen_string_literal: true

class AddAvailabilityToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :availability, :string
    remove_column :materials, :usage, :text
  end
end

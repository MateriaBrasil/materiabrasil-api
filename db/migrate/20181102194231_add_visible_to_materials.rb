# frozen_string_literal: true

class AddVisibleToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :visible, :boolean, default: false
  end
end

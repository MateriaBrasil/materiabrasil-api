# frozen_string_literal: true

class AddHighlightedToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :highlighted, :bool, null: false, default: false
  end
end

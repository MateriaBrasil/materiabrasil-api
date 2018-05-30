# frozen_string_literal: true

class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.string :average_price
      t.string :code

      t.timestamps
    end
  end
end

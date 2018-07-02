# frozen_string_literal: true

class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.string :name, null: false
      t.boolean :default, default: false, null: false

      t.timestamps
    end
  end
end

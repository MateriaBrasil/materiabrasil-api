# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :album, foreign_key: true, index: true, null: false
      t.references :favoritable, polymorphic: true, index: true, null: false

      t.timestamps
    end
  end
end

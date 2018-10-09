# frozen_string_literal: true

class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.references :question, foreign_key: true, null: false, index: true
      t.text :description, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :from, polymorphic: true, index: true, null: false
      t.references :to, polymorphic: true, index: true, null: false
      t.text :text, null: false

      t.timestamps
    end
  end
end

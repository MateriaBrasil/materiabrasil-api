# frozen_string_literal: true

class CreateQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.string :name, null: false
      t.string :about_type, null: false
      t.string :driver, null: false
      t.integer :sorting, null: false

      t.timestamps
    end
  end
end

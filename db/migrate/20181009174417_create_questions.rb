# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :questionnaire, foreign_key: true, null: false, index: true
      t.text :description, null: false
      t.integer :sorting, null: false

      t.timestamps
    end
  end
end

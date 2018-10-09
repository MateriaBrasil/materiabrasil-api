# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :about, polymorphic: true, index: true, null: false
      t.references :question, foreign_key: true, null: false
      t.references :option, foreign_key: true, null: false

      t.index %i[about_type about_id question_id], unique: true

      t.timestamps
    end
  end
end

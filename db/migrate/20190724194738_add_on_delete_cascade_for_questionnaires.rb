# frozen_string_literal: true

class AddOnDeleteCascadeForQuestionnaires < ActiveRecord::Migration[5.2]
  def up
    remove_foreign_key :questions, :questionnaires
    remove_foreign_key :answers, :questions
    remove_foreign_key :options, :questions
    remove_foreign_key :answers, :options
    add_foreign_key :questions, :questionnaires, on_delete: :cascade
    add_foreign_key :options, :questions, on_delete: :cascade
    add_foreign_key :answers, :questions, on_delete: :cascade
    add_foreign_key :answers, :options, on_delete: :cascade
  end

  def down
    remove_foreign_key :questions, :questionnaires
    remove_foreign_key :answers, :questions
    remove_foreign_key :options, :questions
    remove_foreign_key :answers, :options
    add_foreign_key :questions, :questionnaires
    add_foreign_key :options, :questions
    add_foreign_key :answers, :questions
    add_foreign_key :answers, :options
  end
end

# frozen_string_literal: true

class AddHelperTextToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :helper_text, :text, default: ''
  end
end

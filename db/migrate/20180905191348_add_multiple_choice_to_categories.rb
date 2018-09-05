# frozen_string_literal: true

class AddMultipleChoiceToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :multiple_choice, :boolean, default: true
  end
end

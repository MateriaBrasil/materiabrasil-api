# frozen_string_literal: true

class AddWeightsForQuestions < ActiveRecord::Migration[5.2]
  def change
    change_table :questions, bulk: true do |t|
      t.integer :weight_for_small_companies, default: 0
      t.integer :weight_for_medium_companies, default: 0
      t.integer :weight_for_large_companies, default: 0
      t.integer :weight_for_service_companies, default: 0
    end
  end
end

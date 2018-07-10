# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.references :reviewable, polymorphic: true, index: true, null: false
      t.text :text, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end

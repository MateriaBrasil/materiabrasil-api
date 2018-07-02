# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.references :commentable, polymorphic: true, index: true, null: false
      t.text :text, null: false

      t.timestamps
    end
  end
end

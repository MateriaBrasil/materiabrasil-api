# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.string :website, null: false
      t.string :email, null: false
      t.string :cnpj, null: false
      t.string :company_name, null: false
      t.string :municipal_subscription, null: false
      t.string :state_subscription, null: false
      t.string :phone, null: false
      t.string :company_revenue, null: false
      t.integer :number_of_employees, null: false
      t.string :reach, null: false

      t.timestamps
    end
  end
end
# rubocop:enable Metrics/MethodLength

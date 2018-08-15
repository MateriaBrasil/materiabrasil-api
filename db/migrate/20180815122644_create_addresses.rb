# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.2]
  # rubocop:disable Metrics/MethodLength
  def change
    create_table :addresses do |t|
      t.references :supplier, foreign_key: true
      t.string :address_type, null: false
      t.string :street_address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.string :zip_code
      t.string :phone_number

      t.timestamps
    end
  end
  # rubocop:enable Metrics/MethodLength
end

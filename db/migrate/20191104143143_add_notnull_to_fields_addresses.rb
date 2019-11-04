class AddNotnullToFieldsAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :address_type, :string, null: false
    change_column :addresses, :street_address, :string, null: false
    change_column :addresses, :country, :string, null: false
  end
end

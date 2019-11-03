class ChangeFieldsAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :address_type, :string, null: true
    change_column :addresses, :street_address, :string, null: true
    change_column :addresses, :country, :string, null: true
  end
end

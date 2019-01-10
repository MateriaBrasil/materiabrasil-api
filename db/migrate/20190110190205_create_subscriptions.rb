# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def up
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :state, null: false, default: 'pending'
      t.string :payment_method
      t.timestamp :activated_at

      t.timestamps
    end
  end

  def down
    drop_table :subscriptions
    execute <<-SQL
      DROP TYPE subscription_state;
    SQL
  end
end
# rubocop:enable Metrics/MethodLength
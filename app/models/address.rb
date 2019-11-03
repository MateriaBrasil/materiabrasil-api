# frozen_string_literal: true

class Address < ApplicationRecord
  # validates :supplier, :address_type, :street_address, :city, :state, :country,
  #   presence: true
  validates :supplier, :city, :state, presence: :true

  validates :address_type, inclusion: { in: %w[manufacture postal] }, :allow_nil => true

  belongs_to :supplier

  # rubocop:disable Metrics/MethodLength
  def as_json(_options = {})
    {
      id: id,
      supplier_id: supplier.id,
      address_type: address_type,
      street_address: street_address,
      city: city,
      state: state,
      country: country,
      zip_code: zip_code,
      phone_number: phone_number
    }
  end
  # rubocop:enable Metrics/MethodLength
end

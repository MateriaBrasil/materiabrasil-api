# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  subject(:address) do
    described_class.new(
      supplier: supplier,
      address_type: 'manufacture',
      street_address: 'Foo street, 123',
      city: 'Foo city',
      state: 'Foo state',
      country: 'Foo country'
    )
  end

  let(:supplier) do
    Supplier.create!(
      name: 'Foo Bar',
      description: 'Foo description',
      website: 'http://foo',
      email: 'foo@company.com',
      cnpj: '123456789',
      company_name: 'Foo Inc',
      municipal_subscription: 'does not apply',
      state_subscription: '987654321',
      phone: '5551987654321',
      company_revenue: '100000000',
      number_of_employees: 1000,
      reach: 'country',
      image_url: 'http://foo-image',
      user: current_user
    )
  end

  it { is_expected.to validate_presence_of :supplier }
  it { is_expected.to validate_presence_of :address_type }
  it { is_expected.to validate_presence_of :street_address }
  it { is_expected.to validate_presence_of :city }
  it { is_expected.to validate_presence_of :state }

  it do
    is_expected.to validate_inclusion_of(:address_type)
      .in_array(%w[manufacture postal])
  end

  it { is_expected.to belong_to :supplier }

  describe '#as_json' do
    let(:json) do
      {
        id: address.id,
        supplier_id: supplier.id,
        address_type: address.address_type,
        street_address: address.street_address,
        city: address.city,
        state: address.state,
        country: address.country,
        zip_code: address.zip_code,
        phone_number: address.phone_number
      }
    end

    it { expect(address.as_json).to eq(json) }
  end
end

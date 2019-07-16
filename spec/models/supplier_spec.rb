# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Supplier, type: :model do
  subject(:supplier) do
    Supplier.new(
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
      type_of_company: 1,
      reach: 'country',
      image_url: 'http://foo-image',
      user: current_user
    )
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :website }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :cnpj }
  it { is_expected.to validate_presence_of :company_name }
  it { is_expected.to validate_presence_of :municipal_subscription }
  it { is_expected.to validate_presence_of :state_subscription }
  it { is_expected.to validate_presence_of :phone }
  it { is_expected.to validate_presence_of :reach }
  it { is_expected.to define_enum_for(:type_of_company) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:addresses) }
  it { is_expected.to have_many(:materials) }

  describe '#as_json' do
    let(:json) do
      {
        id: supplier.id,
        name: supplier.name,
        description: supplier.description,
        website: supplier.website,
        email: supplier.email,
        cnpj: supplier.cnpj,
        company_name: supplier.company_name,
        municipal_subscription: supplier.municipal_subscription,
        state_subscription: supplier.state_subscription,
        phone: supplier.phone,
        company_revenue: supplier.company_revenue,
        reach: supplier.reach,
        user_id: supplier.user_id,
        image_url: supplier.image_url,
        materials: supplier.materials,
        type_of_company: 1
      }
    end

    it { expect(supplier.as_json).to eq(json) }
  end
end

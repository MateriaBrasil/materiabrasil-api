# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Supplier, type: :model do
  subject(:supplier) do
    Supplier.new(name: 'Foo', email: 'foo@bar.com')
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
  it { is_expected.to validate_presence_of :company_revenue }
  it { is_expected.to validate_presence_of :number_of_employees }
  it { is_expected.to validate_presence_of :reach }

  it { is_expected.to belong_to(:user) }

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
        number_of_employees: supplier.number_of_employees,
        reach: supplier.reach
      }
    end

    it { expect(supplier.as_json).to eq(json) }
  end
end

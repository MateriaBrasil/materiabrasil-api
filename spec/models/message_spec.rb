# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  subject(:message) do
    described_class.new(
      from: current_user,
      to: supplier,
      text: 'Foo bar'
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

  it { is_expected.to validate_presence_of :from }
  it { is_expected.to validate_presence_of :to }
  it { is_expected.to validate_presence_of :text }

  it { is_expected.to belong_to :to }
  it { is_expected.to belong_to :from }

  describe '#as_json' do
    let(:json) do
      {
        id: message.id,
        from: current_user.as_json,
        to: supplier.as_json,
        text: message.text,
        created_at: message.created_at
      }
    end

    it { expect(message.as_json).to eq(json) }
  end
end

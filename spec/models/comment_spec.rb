# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) do
    Comment.create!(
      text: 'foo',
      user: user,
      commentable: material
    )
  end

  let(:supplier) do
    Supplier.create!(
      user: current_user,
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
      image_url: 'http://foo-image'
    )
  end

  let(:material) do
    Material.create!(
      name: 'Foo',
      image_url: 'http://foo.bar',
      description: 'Some description',
      average_price: 'R$ 111,00',
      code: '1234',
      manufacturing_location: 'Foo City/FO',
      sales_location: 'Bar City/BR',
      technical_specification_url: 'http://foo',
      properties: 'Foo properties',
      usage: 'Bar usage',
      supplier: supplier
    )
  end

  let(:user) do
    User.create!(
      email: 'bar@foo.com',
      first_name: 'Foo',
      last_name: 'Bar',
      password: 'foobarfoo'
    )
  end

  it { is_expected.to validate_presence_of :text }
  it { is_expected.to validate_presence_of :commentable }
  it { is_expected.to validate_presence_of :user }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:commentable) }

  describe '#as_json' do
    let(:json) do
      {
        id: comment.id,
        user: user.as_json,
        text: comment.text,
        created_at: comment.created_at
      }
    end

    it { expect(comment.as_json).to eq(json) }
  end
end

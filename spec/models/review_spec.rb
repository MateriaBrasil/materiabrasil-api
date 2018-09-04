# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  subject(:review) do
    Review.create(
      text: 'foo',
      rating: 4,
      user: user,
      reviewable: material
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
      technical_specification_url: 'http://foo',
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
  it { is_expected.to validate_presence_of :reviewable }
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_presence_of :rating }
  it { is_expected.to validate_inclusion_of(:rating).in_range(1..5) }
  it do
    is_expected.to validate_uniqueness_of(:user_id)
      .scoped_to(%i[reviewable_type reviewable_id])
      .with_message 'já avaliou.'
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:reviewable) }

  describe '#as_json' do
    let(:json) do
      {
        id: review.id,
        user: user.as_json,
        text: review.text,
        rating: review.rating,
        created_at: review.created_at
      }
    end

    it { expect(review.as_json).to eq(json) }
  end
end

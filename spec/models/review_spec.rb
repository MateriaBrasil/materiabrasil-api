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

  let(:material) do
    Material.create!(
      name: 'Foo',
      image_url: 'http://foo.bar',
      description: 'Some description',
      average_price: 'R$ 111,00',
      code: '1234',
      supplier_name: 'Foo Supplier',
      supplier_contact: 'foo@bar.com',
      manufacturing_location: 'Foo City/FO',
      sales_location: 'Bar City/BR',
      technical_specification_url: 'http://foo',
      properties: 'Foo properties',
      usage: 'Bar usage'
    )
  end

  let(:user) do
    User.create!(
      email: 'bar@foo.com',
      name: 'Foo Bar',
      password: 'foobarfoo'
    )
  end

  it { is_expected.to validate_presence_of :text }
  it { is_expected.to validate_presence_of :reviewable }
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_presence_of :rating }
  it { is_expected.to validate_inclusion_of(:rating).in_range(1..5) }
  it do
    is_expected.to validate_uniqueness_of(:user)
      .scoped_to %i[reviewable_type reviewable_id]
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

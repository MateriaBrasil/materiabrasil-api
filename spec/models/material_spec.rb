# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Material, type: :model do
  subject(:material) do
    Material.new(
      name: 'Foo',
      image_url: 'http://foo.bar',
      description: 'Some description',
      average_price: 'R$ 111,00',
      code: '1234',
      technical_specification_url: 'http://foo',
      properties: 'Foo properties',
      usage: 'Bar usage',
      cover_image_url: 'http://cover-foo',
      highlight_image_url: 'http://highlight-foo',
      list_image_url: 'http://list-foo',
      supplier: supplier
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

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :average_price }
  it { is_expected.to validate_presence_of :code }
  it { is_expected.to validate_presence_of :properties }
  it { is_expected.to validate_presence_of :usage }

  it { is_expected.to have_many :comments }
  it { is_expected.to belong_to :supplier }

  describe '#as_json' do
    let(:json) do
      {
        id: material.id,
        supplier_id: supplier.id,
        supplier_name: supplier.name,
        name: material.name,
        image_url: material.image_url,
        description: material.description,
        average_price: material.average_price,
        code: material.code,
        technical_specification_url: material.technical_specification_url,
        properties: material.properties,
        usage: material.usage,
        average_rating: material.average_rating,
        highlighted: material.highlighted,
        cover_image_url: material.cover_image_url,
        highlight_image_url: material.highlight_image_url,
        list_image_url: material.list_image_url
      }
    end

    it 'returns only the necessary attributes' do
      expect(material.as_json).to eq(json)
    end
  end

  describe '#average_rating' do
    let(:other_user) do
      User.create!(
        email: 'bar@foo.com',
        first_name: 'Foo',
        last_name: 'Bar',
        password: 'foobarfoo'
      )
    end

    before do
      Review.create(
        text: 'foo',
        rating: 1,
        user: current_user,
        reviewable: material
      )
      Review.create(
        text: 'foo',
        rating: 4,
        user: other_user,
        reviewable: material
      )
    end

    it { expect(material.average_rating).to eq(2.5) }
  end
end

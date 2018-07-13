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
      supplier_name: 'Foo Supplier',
      supplier_contact: 'foo@bar.com',
      manufacturing_location: 'Foo City/FO',
      sales_location: 'Bar City/BR',
      technical_specification_url: 'http://foo',
      properties: 'Foo properties',
      usage: 'Bar usage'
    )
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :image_url }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :average_price }
  it { is_expected.to validate_presence_of :code }
  it { is_expected.to validate_presence_of :supplier_name }
  it { is_expected.to validate_presence_of :supplier_contact }
  it { is_expected.to validate_presence_of :manufacturing_location }
  it { is_expected.to validate_presence_of :sales_location }
  it { is_expected.to validate_presence_of :technical_specification_url }
  it { is_expected.to validate_presence_of :properties }
  it { is_expected.to validate_presence_of :usage }

  it { is_expected.to have_many :comments }

  describe '#as_json' do
    let(:json) do
      {
        id: material.id,
        name: material.name,
        image_url: material.image_url,
        description: material.description,
        average_price: material.average_price,
        code: material.code,
        supplier_name: material.supplier_name,
        supplier_contact: material.supplier_contact,
        manufacturing_location: material.manufacturing_location,
        sales_location: material.sales_location,
        technical_specification_url: material.technical_specification_url,
        properties: material.properties,
        usage: material.usage,
        average_rating: material.average_rating
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
        name: 'Foo Bar',
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

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
      supplier_email: 'foo@bar.com',
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
  it { is_expected.to validate_presence_of :supplier_email }
  it { is_expected.to validate_presence_of :manufacturing_location }
  it { is_expected.to validate_presence_of :sales_location }
  it { is_expected.to validate_presence_of :technical_specification_url }
  it { is_expected.to validate_presence_of :properties }
  it { is_expected.to validate_presence_of :usage }

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
        supplier_email: material.supplier_email,
        manufacturing_location: material.manufacturing_location,
        sales_location: material.sales_location,
        technical_specification_url: material.technical_specification_url,
        properties: material.properties,
        usage: material.usage
      }
    end

    it 'returns only the necessary attributes' do
      expect(material.as_json).to eq(json)
    end
  end
end

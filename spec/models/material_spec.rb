# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Material, type: :model do
  subject(:material) do
    Material.new(
      name: 'Foo',
      image_url: 'http://foo.bar',
      description: 'Some description',
      average_price: 'R$ 111,00',
      code: '1234'
    )
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :image_url }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :average_price }
  it { is_expected.to validate_presence_of :code }

  describe '#as_json' do
    let(:json) do
      {
        id: material.id,
        name: material.name,
        image_url: material.image_url,
        description: material.description,
        average_price: material.average_price,
        code: material.code
      }
    end

    it 'returns only the necessary attributes' do
      expect(material.as_json).to eq(json)
    end
  end
end

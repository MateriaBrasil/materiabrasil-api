# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  subject(:favorite) do
    Favorite.create(
      album: album,
      favoritable: material
    )
  end

  let(:album) do
    Album.create!(
      name: 'foo',
      user: current_user,
      default: true
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

  it { is_expected.to validate_presence_of :album }
  it { is_expected.to validate_presence_of :favoritable }

  it { is_expected.to belong_to(:album) }
  it { is_expected.to belong_to(:favoritable) }

  describe '#as_json' do
    let(:json) do
      {
        id: favorite.id,
        album_id: album.id,
        favoritable_id: material.id,
        favoritable_type: material.class.name,
        favoritable: material.as_json
      }
    end

    it { expect(favorite.as_json).to eq(json) }
  end
end

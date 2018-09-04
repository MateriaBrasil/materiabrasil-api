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

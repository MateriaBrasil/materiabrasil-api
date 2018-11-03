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
      cover_image_url: 'http://cover-foo',
      highlight_image_url: 'http://highlight-foo',
      list_image_url: 'http://list-foo',
      supplier: supplier,
      unit_of_sale: 'foo unit',
      minimum_purchase_quantity: 10,
      maximum_purchase_quantity: 100,
      ncm_code: '03022300',
      sh_code: '0103.91',
      certifications: 'foo certifications',
      certifications_url: 'http://foo.certifications',
      prizes: 'Prizes bar',
      density: 'Some density',
      dimensions: 'Some dimensions',
      availability: 'foo state'
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

  it { is_expected.to have_many :comments }
  it { is_expected.to belong_to :supplier }
  it { is_expected.to have_many(:categories).through(:material_categories) }

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
        average_rating: material.average_rating,
        highlighted: material.highlighted,
        cover_image_url: material.cover_image_url,
        highlight_image_url: material.highlight_image_url,
        list_image_url: material.list_image_url,
        unit_of_sale: material.unit_of_sale,
        minimum_purchase_quantity: material.minimum_purchase_quantity,
        maximum_purchase_quantity: material.maximum_purchase_quantity,
        ncm_code: material.ncm_code,
        sh_code: material.sh_code,
        certifications: material.certifications,
        certifications_url: material.certifications_url,
        prizes: material.prizes,
        density: material.density,
        dimensions: material.dimensions,
        availability: material.availability,
        materiality_driver: material.materiality_driver,
        manufacture_driver: material.manufacture_driver,
        management_driver: material.management_driver,
        social_driver: material.social_driver,
        visible: false
      }
    end

    it 'returns only the necessary attributes' do
      expect(material.as_json).to eq(json)
    end
  end

  describe '.with_categories' do
    let(:materials) do
      Material.all
    end

    let(:category) do
      Category.create!(
        name: 'Some Parent Category',
        multiple_choice: false
      )
    end

    before do
      MaterialCategory.create!(material: material, category: category)
    end

    it { expect(materials.with_categories([category.id])).to include(material) }
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

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of :name }
  it {
    is_expected.to belong_to(:parent)
      .class_name('Category')
      .inverse_of(:children)
  }

  it {
    is_expected.to have_many(:children)
      .class_name('Category')
      .with_foreign_key('parent_id')
  }

  it { is_expected.to have_many(:materials).through(:material_categories) }

  describe '.root' do
    subject { described_class.root }

    let(:root_category1) { described_class.create!(name: 'I am root') }
    let(:root_category2) { described_class.create!(name: 'I too am root') }
    let(:root_category3) { described_class.create!(name: 'I am groot') }

    before do
      described_class.create!(
        name: 'I am son of root',
        parent: root_category1
      )

      described_class.create!(
        name: 'I too am son of root',
        parent: root_category2
      )

      described_class.create!(
        name: 'I am son of groot',
        parent: root_category3
      )
    end

    it 'only returns records without a parent_id' do
      expected_array = [root_category1, root_category2, root_category3]
      is_expected.to match_array expected_array
    end
  end

  describe '#as_json' do
    subject { category.as_json }

    let(:category) { described_class.create!(name: 'Some Category') }

    context 'without children' do
      let(:expected_hash) do
        {
          id: category.id,
          parent_id: category.parent_id,
          name: 'Some Category',
          sorting: category.sorting,
          multiple_choice: true,
          children: []
        }
      end

      it { is_expected.to eq expected_hash }
    end

    context 'with children and grandchildren' do
      let(:child_category) do
        category.children.create!(
          name: 'Child category',
          multiple_choice: false
        )
      end
      let(:grandchild_category) do
        child_category.children.create!(
          name: 'Grandchild category'
        )
      end

      let(:expected_hash) do
        {
          id: category.id,
          parent_id: category.parent_id,
          sorting: category.sorting,
          name: 'Some Category',
          multiple_choice: true,
          children: [
            {
              id: child_category.id,
              parent_id: child_category.parent_id,
              sorting: child_category.sorting,
              name: 'Child category',
              multiple_choice: false,
              children: [
                {
                  id: grandchild_category.id,
                  parent_id: grandchild_category.parent_id,
                  sorting: grandchild_category.sorting,
                  name: 'Grandchild category',
                  multiple_choice: true,
                  children: []
                }
              ]
            }
          ]
        }
      end

      before { grandchild_category }

      it { is_expected.to eq expected_hash }
    end
  end
end

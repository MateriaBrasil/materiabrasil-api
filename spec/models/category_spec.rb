require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to belong_to(:parent).class_name('Category') }
  it { is_expected.to have_many(:children).class_name('Category').with_foreign_key('parent_id')}
  it { should have_many(:materials).through(:material_categories) }

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
end

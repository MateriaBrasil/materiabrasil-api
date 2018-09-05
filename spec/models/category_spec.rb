require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to belong_to(:parent).class_name('Category')}
  it { is_expected.to have_many(:children).class_name('Category').with_foreign_key('parent_id')}
end

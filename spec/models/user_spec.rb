# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(name: 'Foo', email: 'foo@bar.com')
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }

  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :albums }

  describe '#as_json' do
    let(:json) do
      {
        id: user.id,
        email: user.email,
        name: user.name
      }
    end

    it { expect(user.as_json).to eq(json) }
  end

  it { expect(user.tokens_has_json_column_type?).to be(false) }
end

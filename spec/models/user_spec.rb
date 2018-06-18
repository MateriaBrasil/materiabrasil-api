# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(name: 'Foo', email: 'foo@bar.com')
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }

  describe '#as_json' do
    let(:json) do
      {
        id: user.id,
        email: user.email,
        name: user.name
      }
    end

    it 'returns only the necessary attributes' do
      expect(user.as_json).to eq(json)
    end
  end

  describe '#devise_token_auth fix' do
    it 'returns false' do
      expect(user.tokens_has_json_column_type?).to be(false)
    end
  end
end

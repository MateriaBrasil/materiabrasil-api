# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Album, type: :model do
  subject(:album) do
    Album.create(
      name: 'foo',
      user: current_user,
      default: true
    )
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :user }

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :favorites }

  describe '#as_json' do
    let(:json) do
      {
        id: album.id,
        user_id: current_user.id,
        name: album.name,
        default: album.default
      }
    end

    it { expect(album.as_json).to eq(json) }
  end
end

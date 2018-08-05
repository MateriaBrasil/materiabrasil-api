# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.com')
  end

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }

  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :albums }
  it { is_expected.to have_many :suppliers }

  describe '#as_json' do
    let(:json) do
      {
        id: user.id,
        email: user.email,
        first_name: user.first_name,
        last_name: user.last_name,
        image_url: user.image_url,
        city: user.city,
        state: user.state,
        country: user.country,
        bio: user.bio,
        company: user.company,
        work_title: user.work_title,
        website: user.website,
        albums: user.albums,
        public_profile: user.public_profile
      }
    end

    it { expect(user.as_json).to eq(json) }
  end

  it { expect(user.tokens_has_json_column_type?).to be(false) }
end

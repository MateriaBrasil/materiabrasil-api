# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AlbumUser, type: :model do
  subject { AlbumUser.create(album: album, user: user) }

  let(:user) do
    User.create!(
      email: 'bar@foo.com',
      first_name: 'Foo',
      last_name: 'Bar',
      password: 'foobarfoo'
    )
  end

  let(:album) do
    Album.create!(
      name: 'foo',
      user: user,
      default: true,
      private: true
    )
  end

  it { is_expected.to validate_presence_of :album }
  it { is_expected.to validate_presence_of :user }

  it do
    is_expected.to validate_uniqueness_of(:user_id).scoped_to(:album_id)
  end
end

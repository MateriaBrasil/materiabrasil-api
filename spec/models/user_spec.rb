# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.create!(
      email: 'bar@foo.com',
      first_name: 'Foo',
      last_name: 'Bar',
      password: 'foobarfoo'
    )
  end

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }

  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :albums }
  it { is_expected.to have_many :suppliers }
  it { is_expected.to have_many(:subscriptions) }

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
        suppliers: user.suppliers,
        public_profile: user.public_profile
      }
    end

    it { expect(user.as_json).to eq(json) }
  end

  it { expect(user.tokens_has_json_column_type?).to be(false) }

  describe 'subscribed?' do
    subject { user.subscribed? }

    context 'with an active subscription' do
      before do
        Subscription.create!(user: user, state: 'active')
      end

      it { is_expected.to be(true) }
    end

    context 'with a non-active subscription' do
      before do
        Subscription.create!(user: user)
      end

      it { is_expected.to be(false) }
    end
  end

  describe 'subscription' do
    subject { user.subscription }

    context 'without subscriptions' do
      it { is_expected.to be(nil) }
    end

    context 'with subscriptions' do
      before do
        Subscription.create!(user: user)
      end

      it { is_expected.to eq(user.subscriptions.order(:created_at).last) }
    end
  end
end

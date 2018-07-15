# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy do
  subject { described_class }

  permissions :show? do
    it { is_expected.to permit(current_user, current_user) }

    context 'when it is another user' do
      let(:other_user) do
        User.create!(
          name: 'Bar foo',
          email: 'bar@foo.com',
          password: '123456789',
          public_profile: public_profile
        )
      end

      context 'with public_profile' do
        let(:public_profile) { true }

        it { is_expected.to permit(current_user, other_user) }
      end

      context 'without public_profile' do
        let(:public_profile) { false }

        it { is_expected.not_to permit(current_user, other_user) }
      end
    end
  end
end

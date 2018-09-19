# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Topic, type: :model do
  subject(:topic) do
    Topic.create!(
      text: 'foo',
      subject: 'Foo bar topic',
      user: current_user
    )
  end

  it { is_expected.to validate_presence_of :text }
  it { is_expected.to validate_presence_of :subject }
  it { is_expected.to validate_presence_of :user }

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments }

  describe '#as_json' do
    let(:json) do
      {
        id: topic.id,
        subject: topic.subject,
        text: topic.text,
        user: current_user.as_json,
        created_at: topic.created_at,
        updated_at: topic.updated_at
      }
    end

    it 'returns only the necessary attributes' do
      expect(topic.as_json).to eq(json)
    end
  end
end

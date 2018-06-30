# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) do
    Comment.new(
      text: 'foo'
    )
  end

  it { is_expected.to validate_presence_of :text }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:commentable) }

  describe '#as_json' do
    let(:json) do
      {
        id: comment.id,
        text: comment.text
      }
    end

    it 'returns only the necessary attributes' do
      expect(comment.as_json).to eq(json)
    end
  end
end

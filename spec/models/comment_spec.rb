# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) do
    Comment.create(
      text: 'foo',
      user: user
    )
  end

  let(:user) do
    User.create!(
      email: 'bar@foo.com',
      name: 'Foo Bar',
      password: 'foobarfoo'
    )
  end

  it { is_expected.to validate_presence_of :text }
  it { is_expected.to validate_presence_of :commentable }
  it { is_expected.to validate_presence_of :user }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:commentable) }

  describe '#as_json' do
    let(:json) do
      {
        id: comment.id,
        user: user.as_json,
        text: comment.text,
        created_at: comment.created_at
      }
    end

    it { expect(comment.as_json).to eq(json) }
  end
end

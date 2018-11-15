# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  subject(:question) do
    question = described_class.create!(
      questionnaire: questionnaire,
      description: 'Foo bar',
      sorting: 123
    )
    %w[foo bar].each_with_index do |text, index|
      question.options.create!(
        description: text,
        value: index
      )
    end
    question
  end

  let(:questionnaire) do
    Questionnaire.create(
      name: 'Foo',
      about_type: 'Supplier',
      driver: 'materiality_driver',
      sorting: 123
    )
  end

  it { is_expected.to belong_to :questionnaire }
  it { is_expected.to validate_presence_of :questionnaire }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :sorting }

  describe '#as_json' do
    let(:json) do
      {
        id: question.id,
        description: 'Foo bar',
        options: Option.order(:value).as_json
      }
    end

    it { expect(question.as_json).to eq(json) }
  end
end

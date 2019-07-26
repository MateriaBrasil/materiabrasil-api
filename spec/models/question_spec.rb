# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  subject(:question) do
    question = described_class.create!(
      questionnaire: questionnaire,
      helper_text: 'Foo Bar helper text',
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
  it { is_expected.to have_many(:options).dependent(:destroy) }
  it { is_expected.to have_many(:answers).dependent(:destroy) }
  it { is_expected.to accept_nested_attributes_for :options }
  it { is_expected.to validate_presence_of :questionnaire }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :sorting }

  it {
    is_expected.to validate_numericality_of(:weight_for_small_companies)
      .is_greater_than_or_equal_to(0).is_less_than_or_equal_to(3)
  }

  it {
    is_expected.to validate_numericality_of(:weight_for_medium_companies)
      .is_greater_than_or_equal_to(0).is_less_than_or_equal_to(3)
  }

  it {
    is_expected.to validate_numericality_of(:weight_for_large_companies)
      .is_greater_than_or_equal_to(0).is_less_than_or_equal_to(3)
  }

  it {
    is_expected.to validate_numericality_of(:weight_for_service_companies)
      .is_greater_than_or_equal_to(0).is_less_than_or_equal_to(3)
  }

  describe '#as_json' do
    let(:json) do
      {
        id: question.id,
        description: 'Foo bar',
        helper_text: 'Foo Bar helper text',
        options: Option.order(:value).as_json
      }
    end

    it { expect(question.as_json).to eq(json) }
  end
end

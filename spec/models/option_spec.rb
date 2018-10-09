# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Option, type: :model do
  subject(:option) do
    described_class.new(
      question: question,
      description: 'Foo bar',
      value: 123
    )
  end

  let(:question) do
    Question.create(
      questionnaire: questionnaire,
      description: 'Foo bar',
      sorting: 123
    )
  end

  let(:questionnaire) do
    Questionnaire.create(
      name: 'Foo',
      about_type: 'Supplier',
      driver: 'first_driver',
      sorting: 123
    )
  end

  it { is_expected.to belong_to :question }

  it { is_expected.to validate_presence_of :question }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :value }
end

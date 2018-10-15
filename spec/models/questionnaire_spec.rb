# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  subject(:questionnaire) do
    described_class.new(
      name: 'Foo',
      about_type: 'Supplier',
      driver: 'first_driver',
      sorting: 123
    )
  end

  let(:create_questions) do
    %w[foo bar baz].each_with_index do |text, index|
      Question.create!(
        questionnaire: questionnaire,
        description: text,
        sorting: index
      )
    end
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :about_type }
  it { is_expected.to validate_presence_of :driver }
  it { is_expected.to validate_presence_of :sorting }

  describe '#as_json' do
    before do
      create_questions
    end

    let(:json) do
      {
        name: questionnaire.name,
        about_type: questionnaire.about_type,
        driver: questionnaire.driver,
        sorting: questionnaire.sorting,
        questions: Question.all.order(:sorting).as_json
      }
    end

    it 'returns only the necessary attributes' do
      expect(questionnaire.as_json).to eq(json)
    end
  end
end

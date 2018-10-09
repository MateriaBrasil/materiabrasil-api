# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  subject(:question) do
    described_class.new(
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

  it { is_expected.to belong_to :questionnaire }

  it { is_expected.to validate_presence_of :questionnaire }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :sorting }
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject(:answer) do
    described_class.new(
      about: supplier,
      question: question,
      option: option
    )
  end

  let(:supplier) do
    Supplier.create!(
      user: current_user,
      name: 'Foo Bar',
      description: 'Foo description',
      website: 'http://foo',
      email: 'foo@company.com',
      cnpj: '123456789',
      company_name: 'Foo Inc',
      municipal_subscription: 'does not apply',
      state_subscription: '987654321',
      phone: '5551987654321',
      company_revenue: '100000000',
      number_of_employees: 1000,
      reach: 'country',
      image_url: 'http://foo-image'
    )
  end

  let(:option) do
    Option.create(
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

  it { is_expected.to belong_to :about }
  it { is_expected.to belong_to :question }
  it { is_expected.to belong_to :option }

  it { is_expected.to validate_presence_of :about }
  it { is_expected.to validate_presence_of :question }
  it { is_expected.to validate_presence_of :option }

  it do
    is_expected.to validate_uniqueness_of(:question_id)
      .scoped_to(%i[about_type about_id])
      .with_message 'já respondeu.'
  end
end